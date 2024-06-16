// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BidImpl _$$BidImplFromJson(Map<String, dynamic> json) => _$BidImpl(
      routeId: (json['route_id'] as num).toInt(),
      quantity: (json['Quantity'] as num).toInt(),
      requestId: json['request_id'] as String,
      dateStart: DateTime.parse(json['date_start'] as String),
    );

Map<String, dynamic> _$$BidImplToJson(_$BidImpl instance) => <String, dynamic>{
      'route_id': instance.routeId,
      'Quantity': instance.quantity,
      'request_id': instance.requestId,
      'date_start': instance.dateStart.toIso8601String(),
    };
