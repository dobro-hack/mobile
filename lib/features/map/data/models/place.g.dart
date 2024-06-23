// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      id: (json['ID'] as num).toInt(),
      routeId: (json['RouteID'] as num).toInt(),
      name: json['Name'] as String,
      description: json['Description'] as String,
      icon: json['Icon'] as String,
      location: _locationFromJson(json['Location']),
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'RouteID': instance.routeId,
      'Name': instance.name,
      'Description': instance.description,
      'Icon': instance.icon,
      'Location': instance.location?.toJson(),
    };
