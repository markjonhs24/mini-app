// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonDetailEvent {
  int get pokemonId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pokemonId) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pokemonId)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pokemonId)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonDetailLoad value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonDetailLoad value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonDetailLoad value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailEventCopyWith<PokemonDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailEventCopyWith<$Res> {
  factory $PokemonDetailEventCopyWith(
          PokemonDetailEvent value, $Res Function(PokemonDetailEvent) then) =
      _$PokemonDetailEventCopyWithImpl<$Res, PokemonDetailEvent>;
  @useResult
  $Res call({int pokemonId});
}

/// @nodoc
class _$PokemonDetailEventCopyWithImpl<$Res, $Val extends PokemonDetailEvent>
    implements $PokemonDetailEventCopyWith<$Res> {
  _$PokemonDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonId = null,
  }) {
    return _then(_value.copyWith(
      pokemonId: null == pokemonId
          ? _value.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonDetailLoadImplCopyWith<$Res>
    implements $PokemonDetailEventCopyWith<$Res> {
  factory _$$PokemonDetailLoadImplCopyWith(_$PokemonDetailLoadImpl value,
          $Res Function(_$PokemonDetailLoadImpl) then) =
      __$$PokemonDetailLoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pokemonId});
}

/// @nodoc
class __$$PokemonDetailLoadImplCopyWithImpl<$Res>
    extends _$PokemonDetailEventCopyWithImpl<$Res, _$PokemonDetailLoadImpl>
    implements _$$PokemonDetailLoadImplCopyWith<$Res> {
  __$$PokemonDetailLoadImplCopyWithImpl(_$PokemonDetailLoadImpl _value,
      $Res Function(_$PokemonDetailLoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonId = null,
  }) {
    return _then(_$PokemonDetailLoadImpl(
      null == pokemonId
          ? _value.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PokemonDetailLoadImpl implements PokemonDetailLoad {
  const _$PokemonDetailLoadImpl(this.pokemonId);

  @override
  final int pokemonId;

  @override
  String toString() {
    return 'PokemonDetailEvent.load(pokemonId: $pokemonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailLoadImpl &&
            (identical(other.pokemonId, pokemonId) ||
                other.pokemonId == pokemonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pokemonId);

  /// Create a copy of PokemonDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailLoadImplCopyWith<_$PokemonDetailLoadImpl> get copyWith =>
      __$$PokemonDetailLoadImplCopyWithImpl<_$PokemonDetailLoadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pokemonId) load,
  }) {
    return load(pokemonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pokemonId)? load,
  }) {
    return load?.call(pokemonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pokemonId)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(pokemonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonDetailLoad value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonDetailLoad value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonDetailLoad value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class PokemonDetailLoad implements PokemonDetailEvent {
  const factory PokemonDetailLoad(final int pokemonId) =
      _$PokemonDetailLoadImpl;

  @override
  int get pokemonId;

  /// Create a copy of PokemonDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailLoadImplCopyWith<_$PokemonDetailLoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
