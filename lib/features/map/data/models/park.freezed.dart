// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'park.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Park _$ParkFromJson(Map<String, dynamic> json) {
  return _Park.fromJson(json);
}

/// @nodoc
mixin _$Park {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Area')
  List<String>? get area => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParkCopyWith<Park> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkCopyWith<$Res> {
  factory $ParkCopyWith(Park value, $Res Function(Park) then) =
      _$ParkCopyWithImpl<$Res, Park>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'Area') List<String>? area});
}

/// @nodoc
class _$ParkCopyWithImpl<$Res, $Val extends Park>
    implements $ParkCopyWith<$Res> {
  _$ParkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? area = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParkImplCopyWith<$Res> implements $ParkCopyWith<$Res> {
  factory _$$ParkImplCopyWith(
          _$ParkImpl value, $Res Function(_$ParkImpl) then) =
      __$$ParkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'Area') List<String>? area});
}

/// @nodoc
class __$$ParkImplCopyWithImpl<$Res>
    extends _$ParkCopyWithImpl<$Res, _$ParkImpl>
    implements _$$ParkImplCopyWith<$Res> {
  __$$ParkImplCopyWithImpl(_$ParkImpl _value, $Res Function(_$ParkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? area = freezed,
  }) {
    return _then(_$ParkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      area: freezed == area
          ? _value._area
          : area // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParkImpl extends _Park {
  const _$ParkImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'Description') required this.description,
      @JsonKey(name: 'Area') final List<String>? area})
      : _area = area,
        super._();

  factory _$ParkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Description')
  final String description;
  final List<String>? _area;
  @override
  @JsonKey(name: 'Area')
  List<String>? get area {
    final value = _area;
    if (value == null) return null;
    if (_area is EqualUnmodifiableListView) return _area;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Park(id: $id, name: $name, description: $description, area: $area)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._area, _area));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_area));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkImplCopyWith<_$ParkImpl> get copyWith =>
      __$$ParkImplCopyWithImpl<_$ParkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParkImplToJson(
      this,
    );
  }
}

abstract class _Park extends Park {
  const factory _Park(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'Name') required final String name,
      @JsonKey(name: 'Description') required final String description,
      @JsonKey(name: 'Area') final List<String>? area}) = _$ParkImpl;
  const _Park._() : super._();

  factory _Park.fromJson(Map<String, dynamic> json) = _$ParkImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'Area')
  List<String>? get area;
  @override
  @JsonKey(ignore: true)
  _$$ParkImplCopyWith<_$ParkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
