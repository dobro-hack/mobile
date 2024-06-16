// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BidResponse _$BidResponseFromJson(Map<String, dynamic> json) {
  return _BidResponse.fromJson(json);
}

/// @nodoc
mixin _$BidResponse {
  @JsonKey(name: 'TotalItemsCount')
  int get totalBidsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Items')
  List<Bid> get bids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BidResponseCopyWith<BidResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidResponseCopyWith<$Res> {
  factory $BidResponseCopyWith(
          BidResponse value, $Res Function(BidResponse) then) =
      _$BidResponseCopyWithImpl<$Res, BidResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalItemsCount') int totalBidsCount,
      @JsonKey(name: 'Items') List<Bid> bids});
}

/// @nodoc
class _$BidResponseCopyWithImpl<$Res, $Val extends BidResponse>
    implements $BidResponseCopyWith<$Res> {
  _$BidResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBidsCount = null,
    Object? bids = null,
  }) {
    return _then(_value.copyWith(
      totalBidsCount: null == totalBidsCount
          ? _value.totalBidsCount
          : totalBidsCount // ignore: cast_nullable_to_non_nullable
              as int,
      bids: null == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<Bid>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BidResponseImplCopyWith<$Res>
    implements $BidResponseCopyWith<$Res> {
  factory _$$BidResponseImplCopyWith(
          _$BidResponseImpl value, $Res Function(_$BidResponseImpl) then) =
      __$$BidResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalItemsCount') int totalBidsCount,
      @JsonKey(name: 'Items') List<Bid> bids});
}

/// @nodoc
class __$$BidResponseImplCopyWithImpl<$Res>
    extends _$BidResponseCopyWithImpl<$Res, _$BidResponseImpl>
    implements _$$BidResponseImplCopyWith<$Res> {
  __$$BidResponseImplCopyWithImpl(
      _$BidResponseImpl _value, $Res Function(_$BidResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBidsCount = null,
    Object? bids = null,
  }) {
    return _then(_$BidResponseImpl(
      totalBidsCount: null == totalBidsCount
          ? _value.totalBidsCount
          : totalBidsCount // ignore: cast_nullable_to_non_nullable
              as int,
      bids: null == bids
          ? _value._bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<Bid>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BidResponseImpl extends _BidResponse {
  const _$BidResponseImpl(
      {@JsonKey(name: 'TotalItemsCount') required this.totalBidsCount,
      @JsonKey(name: 'Items') required final List<Bid> bids})
      : _bids = bids,
        super._();

  factory _$BidResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BidResponseImplFromJson(json);

  @override
  @JsonKey(name: 'TotalItemsCount')
  final int totalBidsCount;
  final List<Bid> _bids;
  @override
  @JsonKey(name: 'Items')
  List<Bid> get bids {
    if (_bids is EqualUnmodifiableListView) return _bids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bids);
  }

  @override
  String toString() {
    return 'BidResponse(totalBidsCount: $totalBidsCount, bids: $bids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BidResponseImpl &&
            (identical(other.totalBidsCount, totalBidsCount) ||
                other.totalBidsCount == totalBidsCount) &&
            const DeepCollectionEquality().equals(other._bids, _bids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalBidsCount, const DeepCollectionEquality().hash(_bids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BidResponseImplCopyWith<_$BidResponseImpl> get copyWith =>
      __$$BidResponseImplCopyWithImpl<_$BidResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BidResponseImplToJson(
      this,
    );
  }
}

abstract class _BidResponse extends BidResponse {
  const factory _BidResponse(
          {@JsonKey(name: 'TotalItemsCount') required final int totalBidsCount,
          @JsonKey(name: 'Items') required final List<Bid> bids}) =
      _$BidResponseImpl;
  const _BidResponse._() : super._();

  factory _BidResponse.fromJson(Map<String, dynamic> json) =
      _$BidResponseImpl.fromJson;

  @override
  @JsonKey(name: 'TotalItemsCount')
  int get totalBidsCount;
  @override
  @JsonKey(name: 'Items')
  List<Bid> get bids;
  @override
  @JsonKey(ignore: true)
  _$$BidResponseImplCopyWith<_$BidResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
