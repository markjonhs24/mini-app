import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/pokemon.dart';

part 'pokemon_list_state.freezed.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState.initial() = PokemonListInitial;
  const factory PokemonListState.loading() = PokemonListLoading;
  const factory PokemonListState.loaded({
    required List<PokemonListItem> pokemon,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = PokemonListLoaded;
  const factory PokemonListState.error(String message) = PokemonListError;
}
