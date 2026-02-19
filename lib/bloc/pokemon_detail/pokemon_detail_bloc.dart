import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/pokemon_service.dart';
import 'pokemon_detail_event.dart';
import 'pokemon_detail_state.dart';

/// # PokemonDetailBloc
///
/// A BLoC that manages the state for viewing a single Pokemon's details.
///
///
/// The BLoC pattern separates business logic from UI:
/// ## This BLoC's Lifecycle:
///
/// 1. Screen navigates to detail view with `pokemonId`
/// 2. `initState` dispatches `PokemonDetailEvent.load(pokemonId)`
/// 3. BLoC emits `loading` state → UI shows spinner
/// 4. BLoC fetches data from API
/// 5. On success: emits `loaded(pokemon)` → UI shows details
/// 6. On failure: emits `error(message)` → UI shows error
///
/// ## Alternative Structure (Feature-First):
///
/// Instead of grouping all BLoCs together, you can organize by feature:
///
/// ```
/// lib/
/// ├── features/
/// │   ├── pokemon_list/
/// │   │   ├── bloc/
/// │   │   │   ├── pokemon_list_bloc.dart
/// │   │   │   ├── pokemon_list_event.dart
/// │   │   │   └── pokemon_list_state.dart
/// │   │   ├── screens/
/// │   │   │   └── pokemon_list_screen.dart
/// │   │   └── widgets/
/// │   │       └── pokemon_card.dart
/// │   └── pokemon_detail/
/// │       ├── bloc/
/// │       ├── screens/
/// │       └── widgets/
/// ```
class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  final PokemonService _pokemonService;

  PokemonDetailBloc({PokemonService? pokemonService})
      : _pokemonService = pokemonService ?? PokemonService(),
        super(const PokemonDetailState.initial()) {
    // Register the load event handler
    on<PokemonDetailLoad>(_onLoad);
  }

  /// Handles the load event - fetches Pokemon details from API
  ///
  /// Flow:
  /// 1. Emit loading state (show spinner)
  /// 2. Call API service
  /// 3. Emit loaded state with data OR error state with message
  Future<void> _onLoad(
    PokemonDetailLoad event,
    Emitter<PokemonDetailState> emit,
  ) async {
    emit(const PokemonDetailState.loading());

    try {
      final pokemon = await _pokemonService.fetchPokemon(event.pokemonId);
      emit(PokemonDetailState.loaded(pokemon));
    } catch (e) {
      emit(PokemonDetailState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _pokemonService.dispose();
    return super.close();
  }
}
