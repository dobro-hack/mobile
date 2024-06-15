// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BidImpl _$$BidImplFromJson(Map<String, dynamic> json) => _$BidImpl(
      routeId: (json['RouteId'] as num).toInt(),
      quantity: (json['Quantity'] as num).toInt(),
      requestId: json['RequestId'] as String,
      dateStart: DateTime.parse(json['DateStart'] as String),
    );

Map<String, dynamic> _$$BidImplToJson(_$BidImpl instance) => <String, dynamic>{
      'RouteId': instance.routeId,
      'Quantity': instance.quantity,
      'RequestId': instance.requestId,
      'DateStart': instance.dateStart.toIso8601String(),
    };
