import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

// This file defines the data models for the Pokemon app, including the main Pokemon model and related classes for types, stats, abilities, and sprites. It uses the freezed package for immutability and JSON serialization.

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  const factory Pokemon({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<PokemonType> types,
    required List<PokemonStat> stats,
    required List<PokemonAbility> abilities,
    required PokemonSprites sprites,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  String get displayName => name[0].toUpperCase() + name.substring(1);
  String get formattedId => '#${id.toString().padLeft(3, '0')}';
  double get heightInMeters => height / 10;
  double get weightInKg => weight / 10;
}

@freezed
class PokemonType with _$PokemonType {
  const factory PokemonType({
    required int slot,
    required TypeInfo type,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}

@freezed
class TypeInfo with _$TypeInfo {
  const factory TypeInfo({
    required String name,
    required String url,
  }) = _TypeInfo;

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);
}

@freezed
class PokemonStat with _$PokemonStat {
  const PokemonStat._();

  const factory PokemonStat({
    @JsonKey(name: 'base_stat') required int baseStat,
    required int effort,
    required StatInfo stat,
  }) = _PokemonStat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);

  String get displayName {
    switch (stat.name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SP.ATK';
      case 'special-defense':
        return 'SP.DEF';
      case 'speed':
        return 'SPD';
      default:
        return stat.name.toUpperCase();
    }
  }
}

@freezed
class StatInfo with _$StatInfo {
  const factory StatInfo({
    required String name,
    required String url,
  }) = _StatInfo;

  factory StatInfo.fromJson(Map<String, dynamic> json) =>
      _$StatInfoFromJson(json);
}

@freezed
class PokemonAbility with _$PokemonAbility {
  const PokemonAbility._();

  const factory PokemonAbility({
    required AbilityInfo ability,
    @JsonKey(name: 'is_hidden') required bool isHidden,
    required int slot,
  }) = _PokemonAbility;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  String get displayName {
    return ability.name
        .split('-')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}

@freezed
class AbilityInfo with _$AbilityInfo {
  const factory AbilityInfo({
    required String name,
    required String url,
  }) = _AbilityInfo;

  factory AbilityInfo.fromJson(Map<String, dynamic> json) =>
      _$AbilityInfoFromJson(json);
}

@freezed
class PokemonSprites with _$PokemonSprites {
  const PokemonSprites._();

  const factory PokemonSprites({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'back_shiny') String? backShiny,
    OtherSprites? other,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  String? get officialArtwork =>
      other?.officialArtwork?.frontDefault ?? frontDefault;
}

@freezed
class OtherSprites with _$OtherSprites {
  const factory OtherSprites({
    @JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork,
  }) = _OtherSprites;

  factory OtherSprites.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesFromJson(json);
}

@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
}

@freezed
class PokemonListResponse with _$PokemonListResponse {
  const factory PokemonListResponse({
    required int count,
    String? next,
    String? previous,
    required List<PokemonListItem> results,
  }) = _PokemonListResponse;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
}

@freezed
class PokemonListItem with _$PokemonListItem {
  const PokemonListItem._();

  const factory PokemonListItem({
    required String name,
    required String url,
  }) = _PokemonListItem;

  factory PokemonListItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemFromJson(json);

  int get id {
    final segments = url.split('/').where((s) => s.isNotEmpty).toList();
    return int.parse(segments.last);
  }

  String get displayName => name[0].toUpperCase() + name.substring(1);

  String get spriteUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
