import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_event.freezed.dart';

@freezed
class PokemonListEvent with _$PokemonListEvent {
  const factory PokemonListEvent.load() = PokemonListLoad;
  const factory PokemonListEvent.loadMore() = PokemonListLoadMore;
  const factory PokemonListEvent.refresh() = PokemonListRefresh;
}
