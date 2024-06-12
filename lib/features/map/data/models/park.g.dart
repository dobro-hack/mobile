// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'park.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkImpl _$$ParkImplFromJson(Map<String, dynamic> json) => _$ParkImpl(
      id: (json['ID'] as num).toInt(),
      name: json['Name'] as String,
      description: json['Description'] as String,
      area: (json['Area'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ParkImplToJson(_$ParkImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      'Area': instance.area,
    };
