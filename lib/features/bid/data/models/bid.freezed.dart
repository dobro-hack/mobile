// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bid _$BidFromJson(Map<String, dynamic> json) {
  return _Bid.fromJson(json);
}

/// @nodoc
mixin _$Bid {
  @JsonKey(name: 'RouteId')
  int get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestId')
  String get requestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DateStart')
  DateTime get dateStart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BidCopyWith<Bid> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidCopyWith<$Res> {
  factory $BidCopyWith(Bid value, $Res Function(Bid) then) =
      _$BidCopyWithImpl<$Res, Bid>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RouteId') int routeId,
      @JsonKey(name: 'Quantity') int quantity,
      @JsonKey(name: 'RequestId') String requestId,
      @JsonKey(name: 'DateStart') DateTime dateStart});
}

/// @nodoc
class _$BidCopyWithImpl<$Res, $Val extends Bid> implements $BidCopyWith<$Res> {
  _$BidCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? quantity = null,
    Object? requestId = null,
    Object? dateStart = null,
  }) {
    return _then(_value.copyWith(
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BidImplCopyWith<$Res> implements $BidCopyWith<$Res> {
  factory _$$BidImplCopyWith(_$BidImpl value, $Res Function(_$BidImpl) then) =
      __$$BidImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RouteId') int routeId,
      @JsonKey(name: 'Quantity') int quantity,
      @JsonKey(name: 'RequestId') String requestId,
      @JsonKey(name: 'DateStart') DateTime dateStart});
}

/// @nodoc
class __$$BidImplCopyWithImpl<$Res> extends _$BidCopyWithImpl<$Res, _$BidImpl>
    implements _$$BidImplCopyWith<$Res> {
  __$$BidImplCopyWithImpl(_$BidImpl _value, $Res Function(_$BidImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? quantity = null,
    Object? requestId = null,
    Object? dateStart = null,
  }) {
    return _then(_$BidImpl(
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BidImpl extends _Bid {
  const _$BidImpl(
      {@JsonKey(name: 'RouteId') required this.routeId,
      @JsonKey(name: 'Quantity') required this.quantity,
      @JsonKey(name: 'RequestId') required this.requestId,
      @JsonKey(name: 'DateStart') required this.dateStart})
      : super._();

  factory _$BidImpl.fromJson(Map<String, dynamic> json) =>
      _$$BidImplFromJson(json);

  @override
  @JsonKey(name: 'RouteId')
  final int routeId;
  @override
  @JsonKey(name: 'Quantity')
  final int quantity;
  @override
  @JsonKey(name: 'RequestId')
  final String requestId;
  @override
  @JsonKey(name: 'DateStart')
  final DateTime dateStart;

  @override
  String toString() {
    return 'Bid(routeId: $routeId, quantity: $quantity, requestId: $requestId, dateStart: $dateStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BidImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, routeId, quantity, requestId, dateStart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BidImplCopyWith<_$BidImpl> get copyWith =>
      __$$BidImplCopyWithImpl<_$BidImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BidImplToJson(
      this,
    );
  }
}

abstract class _Bid extends Bid {
  const factory _Bid(
          {@JsonKey(name: 'RouteId') required final int routeId,
          @JsonKey(name: 'Quantity') required final int quantity,
          @JsonKey(name: 'RequestId') required final String requestId,
          @JsonKey(name: 'DateStart') required final DateTime dateStart}) =
      _$BidImpl;
  const _Bid._() : super._();

  factory _Bid.fromJson(Map<String, dynamic> json) = _$BidImpl.fromJson;

  @override
  @JsonKey(name: 'RouteId')
  int get routeId;
  @override
  @JsonKey(name: 'Quantity')
  int get quantity;
  @override
  @JsonKey(name: 'RequestId')
  String get requestId;
  @override
  @JsonKey(name: 'DateStart')
  DateTime get dateStart;
  @override
  @JsonKey(ignore: true)
  _$$BidImplCopyWith<_$BidImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
