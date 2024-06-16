// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BidResponseImpl _$$BidResponseImplFromJson(Map<String, dynamic> json) =>
    _$BidResponseImpl(
      totalBidsCount: (json['TotalItemsCount'] as num).toInt(),
      bids: (json['Items'] as List<dynamic>)
          .map((e) => Bid.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BidResponseImplToJson(_$BidResponseImpl instance) =>
    <String, dynamic>{
      'TotalItemsCount': instance.totalBidsCount,
      'Items': instance.bids.map((e) => e.toJson()).toList(),
    };
