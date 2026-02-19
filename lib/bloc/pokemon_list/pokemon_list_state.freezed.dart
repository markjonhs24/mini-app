// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonListInitial value) initial,
    required TResult Function(PokemonListLoading value) loading,
    required TResult Function(PokemonListLoaded value) loaded,
    required TResult Function(PokemonListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonListInitial value)? initial,
    TResult? Function(PokemonListLoading value)? loading,
    TResult? Function(PokemonListLoaded value)? loaded,
    TResult? Function(PokemonListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonListInitial value)? initial,
    TResult Function(PokemonListLoading value)? loading,
    TResult Function(PokemonListLoaded value)? loaded,
    TResult Function(PokemonListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListStateCopyWith<$Res> {
  factory $PokemonListStateCopyWith(
          PokemonListState value, $Res Function(PokemonListState) then) =
      _$PokemonListStateCopyWithImpl<$Res, PokemonListState>;
}

/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res, $Val extends PokemonListState>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PokemonListInitialImplCopyWith<$Res> {
  factory _$$PokemonListInitialImplCopyWith(_$PokemonListInitialImpl value,
          $Res Function(_$PokemonListInitialImpl) then) =
      __$$PokemonListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PokemonListInitialImplCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res, _$PokemonListInitialImpl>
    implements _$$PokemonListInitialImplCopyWith<$Res> {
  __$$PokemonListInitialImplCopyWithImpl(_$PokemonListInitialImpl _value,
      $Res Function(_$PokemonListInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PokemonListInitialImpl implements PokemonListInitial {
  const _$PokemonListInitialImpl();

  @override
  String toString() {
    return 'PokemonListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PokemonListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonListInitial value) initial,
    required TResult Function(PokemonListLoading value) loading,
    required TResult Function(PokemonListLoaded value) loaded,
    required TResult Function(PokemonListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonListInitial value)? initial,
    TResult? Function(PokemonListLoading value)? loading,
    TResult? Function(PokemonListLoaded value)? loaded,
    TResult? Function(PokemonListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonListInitial value)? initial,
    TResult Function(PokemonListLoading value)? loading,
    TResult Function(PokemonListLoaded value)? loaded,
    TResult Function(PokemonListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PokemonListInitial implements PokemonListState {
  const factory PokemonListInitial() = _$PokemonListInitialImpl;
}

/// @nodoc
abstract class _$$PokemonListLoadingImplCopyWith<$Res> {
  factory _$$PokemonListLoadingImplCopyWith(_$PokemonListLoadingImpl value,
          $Res Function(_$PokemonListLoadingImpl) then) =
      __$$PokemonListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PokemonListLoadingImplCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res, _$PokemonListLoadingImpl>
    implements _$$PokemonListLoadingImplCopyWith<$Res> {
  __$$PokemonListLoadingImplCopyWithImpl(_$PokemonListLoadingImpl _value,
      $Res Function(_$PokemonListLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PokemonListLoadingImpl implements PokemonListLoading {
  const _$PokemonListLoadingImpl();

  @override
  String toString() {
    return 'PokemonListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PokemonListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonListInitial value) initial,
    required TResult Function(PokemonListLoading value) loading,
    required TResult Function(PokemonListLoaded value) loaded,
    required TResult Function(PokemonListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonListInitial value)? initial,
    TResult? Function(PokemonListLoading value)? loading,
    TResult? Function(PokemonListLoaded value)? loaded,
    TResult? Function(PokemonListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonListInitial value)? initial,
    TResult Function(PokemonListLoading value)? loading,
    TResult Function(PokemonListLoaded value)? loaded,
    TResult Function(PokemonListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PokemonListLoading implements PokemonListState {
  const factory PokemonListLoading() = _$PokemonListLoadingImpl;
}

/// @nodoc
abstract class _$$PokemonListLoadedImplCopyWith<$Res> {
  factory _$$PokemonListLoadedImplCopyWith(_$PokemonListLoadedImpl value,
          $Res Function(_$PokemonListLoadedImpl) then) =
      __$$PokemonListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore});
}

/// @nodoc
class __$$PokemonListLoadedImplCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res, _$PokemonListLoadedImpl>
    implements _$$PokemonListLoadedImplCopyWith<$Res> {
  __$$PokemonListLoadedImplCopyWithImpl(_$PokemonListLoadedImpl _value,
      $Res Function(_$PokemonListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = null,
    Object? hasMore = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$PokemonListLoadedImpl(
      pokemon: null == pokemon
          ? _value._pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as List<PokemonListItem>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PokemonListLoadedImpl implements PokemonListLoaded {
  const _$PokemonListLoadedImpl(
      {required final List<PokemonListItem> pokemon,
      required this.hasMore,
      this.isLoadingMore = false})
      : _pokemon = pokemon;

  final List<PokemonListItem> _pokemon;
  @override
  List<PokemonListItem> get pokemon {
    if (_pokemon is EqualUnmodifiableListView) return _pokemon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemon);
  }

  @override
  final bool hasMore;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'PokemonListState.loaded(pokemon: $pokemon, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListLoadedImpl &&
            const DeepCollectionEquality().equals(other._pokemon, _pokemon) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pokemon), hasMore, isLoadingMore);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListLoadedImplCopyWith<_$PokemonListLoadedImpl> get copyWith =>
      __$$PokemonListLoadedImplCopyWithImpl<_$PokemonListLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(pokemon, hasMore, isLoadingMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(pokemon, hasMore, isLoadingMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pokemon, hasMore, isLoadingMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonListInitial value) initial,
    required TResult Function(PokemonListLoading value) loading,
    required TResult Function(PokemonListLoaded value) loaded,
    required TResult Function(PokemonListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonListInitial value)? initial,
    TResult? Function(PokemonListLoading value)? loading,
    TResult? Function(PokemonListLoaded value)? loaded,
    TResult? Function(PokemonListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonListInitial value)? initial,
    TResult Function(PokemonListLoading value)? loading,
    TResult Function(PokemonListLoaded value)? loaded,
    TResult Function(PokemonListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PokemonListLoaded implements PokemonListState {
  const factory PokemonListLoaded(
      {required final List<PokemonListItem> pokemon,
      required final bool hasMore,
      final bool isLoadingMore}) = _$PokemonListLoadedImpl;

  List<PokemonListItem> get pokemon;
  bool get hasMore;
  bool get isLoadingMore;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListLoadedImplCopyWith<_$PokemonListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PokemonListErrorImplCopyWith<$Res> {
  factory _$$PokemonListErrorImplCopyWith(_$PokemonListErrorImpl value,
          $Res Function(_$PokemonListErrorImpl) then) =
      __$$PokemonListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PokemonListErrorImplCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res, _$PokemonListErrorImpl>
    implements _$$PokemonListErrorImplCopyWith<$Res> {
  __$$PokemonListErrorImplCopyWithImpl(_$PokemonListErrorImpl _value,
      $Res Function(_$PokemonListErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PokemonListErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PokemonListErrorImpl implements PokemonListError {
  const _$PokemonListErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PokemonListState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListErrorImplCopyWith<_$PokemonListErrorImpl> get copyWith =>
      __$$PokemonListErrorImplCopyWithImpl<_$PokemonListErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PokemonListItem> pokemon, bool hasMore, bool isLoadingMore)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonListInitial value) initial,
    required TResult Function(PokemonListLoading value) loading,
    required TResult Function(PokemonListLoaded value) loaded,
    required TResult Function(PokemonListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonListInitial value)? initial,
    TResult? Function(PokemonListLoading value)? loading,
    TResult? Function(PokemonListLoaded value)? loaded,
    TResult? Function(PokemonListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonListInitial value)? initial,
    TResult Function(PokemonListLoading value)? loading,
    TResult Function(PokemonListLoaded value)? loaded,
    TResult Function(PokemonListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PokemonListError implements PokemonListState {
  const factory PokemonListError(final String message) = _$PokemonListErrorImpl;

  String get message;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListErrorImplCopyWith<_$PokemonListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
