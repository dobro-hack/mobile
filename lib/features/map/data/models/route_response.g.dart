// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteResponseImpl _$$RouteResponseImplFromJson(Map<String, dynamic> json) =>
    _$RouteResponseImpl(
      totalRoutesCount: (json['TotalItemsCount'] as num).toInt(),
      routes: (json['Items'] as List<dynamic>)
          .map((e) => RouteInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RouteResponseImplToJson(_$RouteResponseImpl instance) =>
    <String, dynamic>{
      'TotalItemsCount': instance.totalRoutesCount,
      'Items': instance.routes.map((e) => e.toJson()).toList(),
    };
