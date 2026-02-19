import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/pokemon.dart';

part 'pokemon_detail_state.freezed.dart';

@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState.initial() = PokemonDetailInitial;
  const factory PokemonDetailState.loading() = PokemonDetailLoading;
  const factory PokemonDetailState.loaded(Pokemon pokemon) =
      PokemonDetailLoaded;
  const factory PokemonDetailState.error(String message) = PokemonDetailError;
}
