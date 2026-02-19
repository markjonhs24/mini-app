import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_event.freezed.dart';

@freezed
class PokemonDetailEvent with _$PokemonDetailEvent {
  const factory PokemonDetailEvent.load(int pokemonId) = PokemonDetailLoad;
}
