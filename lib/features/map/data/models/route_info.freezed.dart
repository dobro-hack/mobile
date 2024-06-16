// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteInfo _$RouteInfoFromJson(Map<String, dynamic> json) {
  return _RouteInfo.fromJson(json);
}

/// @nodoc
mixin _$RouteInfo {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParkID')
  int get parkId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Park')
  Park get park => throw _privateConstructorUsedError;
  @JsonKey(name: 'Places')
  List<Place>? get places => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'HowToGet')
  String get howToGet => throw _privateConstructorUsedError;
  @JsonKey(name: 'WhatToTake')
  String get whatToTake => throw _privateConstructorUsedError;
  @JsonKey(name: 'InEmergency')
  String get inEmergency => throw _privateConstructorUsedError;
  @JsonKey(name: 'Recommendations')
  String get recommendations => throw _privateConstructorUsedError;
  @JsonKey(name: 'Length')
  int get length => throw _privateConstructorUsedError;
  @JsonKey(name: 'Duration')
  int get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'Height')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'Difficulty')
  Difficulty get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'Load')
  List<int>? get load => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxLoad')
  int? get maxLoad => throw _privateConstructorUsedError;
  @JsonKey(name: 'Photo')
  List<String>? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteInfoCopyWith<RouteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteInfoCopyWith<$Res> {
  factory $RouteInfoCopyWith(RouteInfo value, $Res Function(RouteInfo) then) =
      _$RouteInfoCopyWithImpl<$Res, RouteInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'ParkID') int parkId,
      @JsonKey(name: 'Park') Park park,
      @JsonKey(name: 'Places') List<Place>? places,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'HowToGet') String howToGet,
      @JsonKey(name: 'WhatToTake') String whatToTake,
      @JsonKey(name: 'InEmergency') String inEmergency,
      @JsonKey(name: 'Recommendations') String recommendations,
      @JsonKey(name: 'Length') int length,
      @JsonKey(name: 'Duration') int duration,
      @JsonKey(name: 'Height') int height,
      @JsonKey(name: 'Difficulty') Difficulty difficulty,
      @JsonKey(name: 'Load') List<int>? load,
      @JsonKey(name: 'MaxLoad') int? maxLoad,
      @JsonKey(name: 'Photo') List<String>? photo});

  $ParkCopyWith<$Res> get park;
}

/// @nodoc
class _$RouteInfoCopyWithImpl<$Res, $Val extends RouteInfo>
    implements $RouteInfoCopyWith<$Res> {
  _$RouteInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parkId = null,
    Object? park = null,
    Object? places = freezed,
    Object? name = null,
    Object? description = null,
    Object? howToGet = null,
    Object? whatToTake = null,
    Object? inEmergency = null,
    Object? recommendations = null,
    Object? length = null,
    Object? duration = null,
    Object? height = null,
    Object? difficulty = null,
    Object? load = freezed,
    Object? maxLoad = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parkId: null == parkId
          ? _value.parkId
          : parkId // ignore: cast_nullable_to_non_nullable
              as int,
      park: null == park
          ? _value.park
          : park // ignore: cast_nullable_to_non_nullable
              as Park,
      places: freezed == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      howToGet: null == howToGet
          ? _value.howToGet
          : howToGet // ignore: cast_nullable_to_non_nullable
              as String,
      whatToTake: null == whatToTake
          ? _value.whatToTake
          : whatToTake // ignore: cast_nullable_to_non_nullable
              as String,
      inEmergency: null == inEmergency
          ? _value.inEmergency
          : inEmergency // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      load: freezed == load
          ? _value.load
          : load // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      maxLoad: freezed == maxLoad
          ? _value.maxLoad
          : maxLoad // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ParkCopyWith<$Res> get park {
    return $ParkCopyWith<$Res>(_value.park, (value) {
      return _then(_value.copyWith(park: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteInfoImplCopyWith<$Res>
    implements $RouteInfoCopyWith<$Res> {
  factory _$$RouteInfoImplCopyWith(
          _$RouteInfoImpl value, $Res Function(_$RouteInfoImpl) then) =
      __$$RouteInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'ParkID') int parkId,
      @JsonKey(name: 'Park') Park park,
      @JsonKey(name: 'Places') List<Place>? places,
      @JsonKey(name: 'Name') String name,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'HowToGet') String howToGet,
      @JsonKey(name: 'WhatToTake') String whatToTake,
      @JsonKey(name: 'InEmergency') String inEmergency,
      @JsonKey(name: 'Recommendations') String recommendations,
      @JsonKey(name: 'Length') int length,
      @JsonKey(name: 'Duration') int duration,
      @JsonKey(name: 'Height') int height,
      @JsonKey(name: 'Difficulty') Difficulty difficulty,
      @JsonKey(name: 'Load') List<int>? load,
      @JsonKey(name: 'MaxLoad') int? maxLoad,
      @JsonKey(name: 'Photo') List<String>? photo});

  @override
  $ParkCopyWith<$Res> get park;
}

/// @nodoc
class __$$RouteInfoImplCopyWithImpl<$Res>
    extends _$RouteInfoCopyWithImpl<$Res, _$RouteInfoImpl>
    implements _$$RouteInfoImplCopyWith<$Res> {
  __$$RouteInfoImplCopyWithImpl(
      _$RouteInfoImpl _value, $Res Function(_$RouteInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parkId = null,
    Object? park = null,
    Object? places = freezed,
    Object? name = null,
    Object? description = null,
    Object? howToGet = null,
    Object? whatToTake = null,
    Object? inEmergency = null,
    Object? recommendations = null,
    Object? length = null,
    Object? duration = null,
    Object? height = null,
    Object? difficulty = null,
    Object? load = freezed,
    Object? maxLoad = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$RouteInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parkId: null == parkId
          ? _value.parkId
          : parkId // ignore: cast_nullable_to_non_nullable
              as int,
      park: null == park
          ? _value.park
          : park // ignore: cast_nullable_to_non_nullable
              as Park,
      places: freezed == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      howToGet: null == howToGet
          ? _value.howToGet
          : howToGet // ignore: cast_nullable_to_non_nullable
              as String,
      whatToTake: null == whatToTake
          ? _value.whatToTake
          : whatToTake // ignore: cast_nullable_to_non_nullable
              as String,
      inEmergency: null == inEmergency
          ? _value.inEmergency
          : inEmergency // ignore: cast_nullable_to_non_nullable
              as String,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      load: freezed == load
          ? _value._load
          : load // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      maxLoad: freezed == maxLoad
          ? _value.maxLoad
          : maxLoad // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value._photo
          : photo // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RouteInfoImpl extends _RouteInfo {
  const _$RouteInfoImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'ParkID') required this.parkId,
      @JsonKey(name: 'Park') required this.park,
      @JsonKey(name: 'Places') required final List<Place>? places,
      @JsonKey(name: 'Name') required this.name,
      @JsonKey(name: 'Description') required this.description,
      @JsonKey(name: 'HowToGet') required this.howToGet,
      @JsonKey(name: 'WhatToTake') required this.whatToTake,
      @JsonKey(name: 'InEmergency') required this.inEmergency,
      @JsonKey(name: 'Recommendations') required this.recommendations,
      @JsonKey(name: 'Length') required this.length,
      @JsonKey(name: 'Duration') required this.duration,
      @JsonKey(name: 'Height') required this.height,
      @JsonKey(name: 'Difficulty') required this.difficulty,
      @JsonKey(name: 'Load') required final List<int>? load,
      @JsonKey(name: 'MaxLoad') required this.maxLoad,
      @JsonKey(name: 'Photo') required final List<String>? photo})
      : _places = places,
        _load = load,
        _photo = photo,
        super._();

  factory _$RouteInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteInfoImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'ParkID')
  final int parkId;
  @override
  @JsonKey(name: 'Park')
  final Park park;
  final List<Place>? _places;
  @override
  @JsonKey(name: 'Places')
  List<Place>? get places {
    final value = _places;
    if (value == null) return null;
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'HowToGet')
  final String howToGet;
  @override
  @JsonKey(name: 'WhatToTake')
  final String whatToTake;
  @override
  @JsonKey(name: 'InEmergency')
  final String inEmergency;
  @override
  @JsonKey(name: 'Recommendations')
  final String recommendations;
  @override
  @JsonKey(name: 'Length')
  final int length;
  @override
  @JsonKey(name: 'Duration')
  final int duration;
  @override
  @JsonKey(name: 'Height')
  final int height;
  @override
  @JsonKey(name: 'Difficulty')
  final Difficulty difficulty;
  final List<int>? _load;
  @override
  @JsonKey(name: 'Load')
  List<int>? get load {
    final value = _load;
    if (value == null) return null;
    if (_load is EqualUnmodifiableListView) return _load;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'MaxLoad')
  final int? maxLoad;
  final List<String>? _photo;
  @override
  @JsonKey(name: 'Photo')
  List<String>? get photo {
    final value = _photo;
    if (value == null) return null;
    if (_photo is EqualUnmodifiableListView) return _photo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RouteInfo(id: $id, parkId: $parkId, park: $park, places: $places, name: $name, description: $description, howToGet: $howToGet, whatToTake: $whatToTake, inEmergency: $inEmergency, recommendations: $recommendations, length: $length, duration: $duration, height: $height, difficulty: $difficulty, load: $load, maxLoad: $maxLoad, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parkId, parkId) || other.parkId == parkId) &&
            (identical(other.park, park) || other.park == park) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.howToGet, howToGet) ||
                other.howToGet == howToGet) &&
            (identical(other.whatToTake, whatToTake) ||
                other.whatToTake == whatToTake) &&
            (identical(other.inEmergency, inEmergency) ||
                other.inEmergency == inEmergency) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            const DeepCollectionEquality().equals(other._load, _load) &&
            (identical(other.maxLoad, maxLoad) || other.maxLoad == maxLoad) &&
            const DeepCollectionEquality().equals(other._photo, _photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      parkId,
      park,
      const DeepCollectionEquality().hash(_places),
      name,
      description,
      howToGet,
      whatToTake,
      inEmergency,
      recommendations,
      length,
      duration,
      height,
      difficulty,
      const DeepCollectionEquality().hash(_load),
      maxLoad,
      const DeepCollectionEquality().hash(_photo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteInfoImplCopyWith<_$RouteInfoImpl> get copyWith =>
      __$$RouteInfoImplCopyWithImpl<_$RouteInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteInfoImplToJson(
      this,
    );
  }
}

abstract class _RouteInfo extends RouteInfo {
  const factory _RouteInfo(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'ParkID') required final int parkId,
      @JsonKey(name: 'Park') required final Park park,
      @JsonKey(name: 'Places') required final List<Place>? places,
      @JsonKey(name: 'Name') required final String name,
      @JsonKey(name: 'Description') required final String description,
      @JsonKey(name: 'HowToGet') required final String howToGet,
      @JsonKey(name: 'WhatToTake') required final String whatToTake,
      @JsonKey(name: 'InEmergency') required final String inEmergency,
      @JsonKey(name: 'Recommendations') required final String recommendations,
      @JsonKey(name: 'Length') required final int length,
      @JsonKey(name: 'Duration') required final int duration,
      @JsonKey(name: 'Height') required final int height,
      @JsonKey(name: 'Difficulty') required final Difficulty difficulty,
      @JsonKey(name: 'Load') required final List<int>? load,
      @JsonKey(name: 'MaxLoad') required final int? maxLoad,
      @JsonKey(name: 'Photo')
      required final List<String>? photo}) = _$RouteInfoImpl;
  const _RouteInfo._() : super._();

  factory _RouteInfo.fromJson(Map<String, dynamic> json) =
      _$RouteInfoImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'ParkID')
  int get parkId;
  @override
  @JsonKey(name: 'Park')
  Park get park;
  @override
  @JsonKey(name: 'Places')
  List<Place>? get places;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'HowToGet')
  String get howToGet;
  @override
  @JsonKey(name: 'WhatToTake')
  String get whatToTake;
  @override
  @JsonKey(name: 'InEmergency')
  String get inEmergency;
  @override
  @JsonKey(name: 'Recommendations')
  String get recommendations;
  @override
  @JsonKey(name: 'Length')
  int get length;
  @override
  @JsonKey(name: 'Duration')
  int get duration;
  @override
  @JsonKey(name: 'Height')
  int get height;
  @override
  @JsonKey(name: 'Difficulty')
  Difficulty get difficulty;
  @override
  @JsonKey(name: 'Load')
  List<int>? get load;
  @override
  @JsonKey(name: 'MaxLoad')
  int? get maxLoad;
  @override
  @JsonKey(name: 'Photo')
  List<String>? get photo;
  @override
  @JsonKey(ignore: true)
  _$$RouteInfoImplCopyWith<_$RouteInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
