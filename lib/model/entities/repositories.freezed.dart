// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repositories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Repositories _$RepositoriesFromJson(Map<String, dynamic> json) {
  return _Repositories.fromJson(json);
}

/// @nodoc
mixin _$Repositories {
  List<Repository> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepositoriesCopyWith<Repositories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoriesCopyWith<$Res> {
  factory $RepositoriesCopyWith(
          Repositories value, $Res Function(Repositories) then) =
      _$RepositoriesCopyWithImpl<$Res>;
  $Res call({List<Repository> items});
}

/// @nodoc
class _$RepositoriesCopyWithImpl<$Res> implements $RepositoriesCopyWith<$Res> {
  _$RepositoriesCopyWithImpl(this._value, this._then);

  final Repositories _value;
  // ignore: unused_field
  final $Res Function(Repositories) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Repository>,
    ));
  }
}

/// @nodoc
abstract class _$$_RepositoriesCopyWith<$Res>
    implements $RepositoriesCopyWith<$Res> {
  factory _$$_RepositoriesCopyWith(
          _$_Repositories value, $Res Function(_$_Repositories) then) =
      __$$_RepositoriesCopyWithImpl<$Res>;
  @override
  $Res call({List<Repository> items});
}

/// @nodoc
class __$$_RepositoriesCopyWithImpl<$Res>
    extends _$RepositoriesCopyWithImpl<$Res>
    implements _$$_RepositoriesCopyWith<$Res> {
  __$$_RepositoriesCopyWithImpl(
      _$_Repositories _value, $Res Function(_$_Repositories) _then)
      : super(_value, (v) => _then(v as _$_Repositories));

  @override
  _$_Repositories get _value => super._value as _$_Repositories;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$_Repositories(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Repository>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Repositories extends _Repositories {
  const _$_Repositories({required final List<Repository> items})
      : _items = items,
        super._();

  factory _$_Repositories.fromJson(Map<String, dynamic> json) =>
      _$$_RepositoriesFromJson(json);

  final List<Repository> _items;
  @override
  List<Repository> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Repositories(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Repositories &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_RepositoriesCopyWith<_$_Repositories> get copyWith =>
      __$$_RepositoriesCopyWithImpl<_$_Repositories>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositoriesToJson(
      this,
    );
  }
}

abstract class _Repositories extends Repositories {
  const factory _Repositories({required final List<Repository> items}) =
      _$_Repositories;
  const _Repositories._() : super._();

  factory _Repositories.fromJson(Map<String, dynamic> json) =
      _$_Repositories.fromJson;

  @override
  List<Repository> get items;
  @override
  @JsonKey(ignore: true)
  _$$_RepositoriesCopyWith<_$_Repositories> get copyWith =>
      throw _privateConstructorUsedError;
}
