// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) {
  return _RouteResponse.fromJson(json);
}

/// @nodoc
mixin _$RouteResponse {
  @JsonKey(name: 'TotalItemsCount')
  int get totalRoutesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Items')
  List<RouteInfo> get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteResponseCopyWith<RouteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteResponseCopyWith<$Res> {
  factory $RouteResponseCopyWith(
          RouteResponse value, $Res Function(RouteResponse) then) =
      _$RouteResponseCopyWithImpl<$Res, RouteResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalItemsCount') int totalRoutesCount,
      @JsonKey(name: 'Items') List<RouteInfo> routes});
}

/// @nodoc
class _$RouteResponseCopyWithImpl<$Res, $Val extends RouteResponse>
    implements $RouteResponseCopyWith<$Res> {
  _$RouteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRoutesCount = null,
    Object? routes = null,
  }) {
    return _then(_value.copyWith(
      totalRoutesCount: null == totalRoutesCount
          ? _value.totalRoutesCount
          : totalRoutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteResponseImplCopyWith<$Res>
    implements $RouteResponseCopyWith<$Res> {
  factory _$$RouteResponseImplCopyWith(
          _$RouteResponseImpl value, $Res Function(_$RouteResponseImpl) then) =
      __$$RouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalItemsCount') int totalRoutesCount,
      @JsonKey(name: 'Items') List<RouteInfo> routes});
}

/// @nodoc
class __$$RouteResponseImplCopyWithImpl<$Res>
    extends _$RouteResponseCopyWithImpl<$Res, _$RouteResponseImpl>
    implements _$$RouteResponseImplCopyWith<$Res> {
  __$$RouteResponseImplCopyWithImpl(
      _$RouteResponseImpl _value, $Res Function(_$RouteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRoutesCount = null,
    Object? routes = null,
  }) {
    return _then(_$RouteResponseImpl(
      totalRoutesCount: null == totalRoutesCount
          ? _value.totalRoutesCount
          : totalRoutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteInfo>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RouteResponseImpl extends _RouteResponse {
  const _$RouteResponseImpl(
      {@JsonKey(name: 'TotalItemsCount') required this.totalRoutesCount,
      @JsonKey(name: 'Items') required final List<RouteInfo> routes})
      : _routes = routes,
        super._();

  factory _$RouteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteResponseImplFromJson(json);

  @override
  @JsonKey(name: 'TotalItemsCount')
  final int totalRoutesCount;
  final List<RouteInfo> _routes;
  @override
  @JsonKey(name: 'Items')
  List<RouteInfo> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  String toString() {
    return 'RouteResponse(totalRoutesCount: $totalRoutesCount, routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteResponseImpl &&
            (identical(other.totalRoutesCount, totalRoutesCount) ||
                other.totalRoutesCount == totalRoutesCount) &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalRoutesCount,
      const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      __$$RouteResponseImplCopyWithImpl<_$RouteResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteResponseImplToJson(
      this,
    );
  }
}

abstract class _RouteResponse extends RouteResponse {
  const factory _RouteResponse(
      {@JsonKey(name: 'TotalItemsCount') required final int totalRoutesCount,
      @JsonKey(name: 'Items')
      required final List<RouteInfo> routes}) = _$RouteResponseImpl;
  const _RouteResponse._() : super._();

  factory _RouteResponse.fromJson(Map<String, dynamic> json) =
      _$RouteResponseImpl.fromJson;

  @override
  @JsonKey(name: 'TotalItemsCount')
  int get totalRoutesCount;
  @override
  @JsonKey(name: 'Items')
  List<RouteInfo> get routes;
  @override
  @JsonKey(ignore: true)
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
