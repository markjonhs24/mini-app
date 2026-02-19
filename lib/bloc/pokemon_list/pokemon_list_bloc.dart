import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/pokemon_service.dart';
import 'pokemon_list_event.dart';
import 'pokemon_list_state.dart';

/// # PokemonListBloc
///
/// A BLoC (Business Logic Component) that manages the state of the Pokemon list.
///
/// ## How BLoC Works:
///
/// BLoC follows a unidirectional data flow pattern:
///
/// ```
/// UI ──(dispatches)──> Events ──(processed by)──> BLoC ──(emits)──> States ──(rebuilds)──> UI
/// ```
///
/// 1. **Events**: User actions or triggers (e.g., `PokemonListLoad`, `PokemonListLoadMore`)
/// 2. **BLoC**: Receives events, processes business logic, calls services
/// 3. **States**: Immutable snapshots representing UI state (e.g., `loading`, `loaded`, `error`)
/// 4. **UI**: Rebuilds based on new state using `BlocBuilder` or `BlocListener`
///
/// ## This BLoC handles:
///
/// - **Initial Load**: Fetches the first page of Pokemon when screen loads
/// - **Pagination**: Loads more Pokemon when user scrolls to bottom
/// - **Refresh**: Resets and reloads the list (pull-to-refresh)
///
/// ## Usage in UI:
///
/// ```dart
/// // Dispatch event
/// context.read<PokemonListBloc>().add(const PokemonListEvent.load());
///
/// // Listen to state
/// BlocBuilder<PokemonListBloc, PokemonListState>(
///   builder: (context, state) {
///     return state.when(
///       initial: () => Container(),
///       loading: () => CircularProgressIndicator(),
///       loaded: (pokemon, hasMore, isLoadingMore) => ListView(...),
///       error: (message) => Text(message),
///     );
///   },
/// )
/// ```
class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonService _pokemonService;

  /// Number of Pokemon to fetch per page
  static const int _limit = 20;

  /// Current pagination offset
  int _offset = 0;

  PokemonListBloc({PokemonService? pokemonService})
      : _pokemonService = pokemonService ?? PokemonService(),
        super(const PokemonListState.initial()) {
    // Register event handlers - each event type maps to a handler method
    on<PokemonListLoad>(_onLoad);
    on<PokemonListLoadMore>(_onLoadMore);
    on<PokemonListRefresh>(_onRefresh);
  }

  /// Handles initial load event
  /// Resets offset and fetches first page of Pokemon
  Future<void> _onLoad(
    PokemonListLoad event,
    Emitter<PokemonListState> emit,
  ) async {
    emit(const PokemonListState.loading());
    _offset = 0;

    try {
      final response = await _pokemonService.fetchPokemonList(
        limit: _limit,
        offset: _offset,
      );
      _offset = _limit;
      emit(PokemonListState.loaded(
        pokemon: response.results,
        hasMore: response.next != null,
      ));
    } catch (e) {
      emit(PokemonListState.error(e.toString()));
    }
  }

  /// Handles pagination - loads next page of Pokemon
  /// Only proceeds if not already loading and more data exists
  Future<void> _onLoadMore(
    PokemonListLoadMore event,
    Emitter<PokemonListState> emit,
  ) async {
    final currentState = state;

    // Guard: Only load more if we're in loaded state, not already loading, and have more data
    if (currentState is! PokemonListLoaded ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    // Emit loading more state (shows loading indicator at bottom)
    emit(currentState.copyWith(isLoadingMore: true));

    try {
      final response = await _pokemonService.fetchPokemonList(
        limit: _limit,
        offset: _offset,
      );
      _offset += _limit;

      // Append new Pokemon to existing list
      emit(PokemonListState.loaded(
        pokemon: [...currentState.pokemon, ...response.results],
        hasMore: response.next != null,
      ));
    } catch (e) {
      // On error, just stop loading indicator, keep existing data
      emit(currentState.copyWith(isLoadingMore: false));
    }
  }

  /// Handles pull-to-refresh - resets and reloads entire list
  Future<void> _onRefresh(
    PokemonListRefresh event,
    Emitter<PokemonListState> emit,
  ) async {
    _offset = 0;

    try {
      final response = await _pokemonService.fetchPokemonList(
        limit: _limit,
        offset: _offset,
      );
      _offset = _limit;
      emit(PokemonListState.loaded(
        pokemon: response.results,
        hasMore: response.next != null,
      ));
    } catch (e) {
      emit(PokemonListState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _pokemonService.dispose();
    return super.close();
  }
}
