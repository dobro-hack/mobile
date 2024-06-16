// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteInfoImpl _$$RouteInfoImplFromJson(Map<String, dynamic> json) =>
    _$RouteInfoImpl(
      id: (json['ID'] as num).toInt(),
      parkId: (json['ParkID'] as num).toInt(),
      park: Park.fromJson(json['Park'] as Map<String, dynamic>),
      places: (json['Places'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String,
      description: json['Description'] as String,
      howToGet: json['HowToGet'] as String,
      whatToTake: json['WhatToTake'] as String,
      inEmergency: json['InEmergency'] as String,
      recommendations: json['Recommendations'] as String,
      length: (json['Length'] as num).toInt(),
      duration: (json['Duration'] as num).toInt(),
      height: (json['Height'] as num).toInt(),
      difficulty: $enumDecode(_$DifficultyEnumMap, json['Difficulty']),
      load: (json['Load'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      maxLoad: (json['MaxLoad'] as num?)?.toInt(),
      photo:
          (json['Photo'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RouteInfoImplToJson(_$RouteInfoImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ParkID': instance.parkId,
      'Park': instance.park.toJson(),
      'Places': instance.places?.map((e) => e.toJson()).toList(),
      'Name': instance.name,
      'Description': instance.description,
      'HowToGet': instance.howToGet,
      'WhatToTake': instance.whatToTake,
      'InEmergency': instance.inEmergency,
      'Recommendations': instance.recommendations,
      'Length': instance.length,
      'Duration': instance.duration,
      'Height': instance.height,
      'Difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'Load': instance.load,
      'MaxLoad': instance.maxLoad,
      'Photo': instance.photo,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
};
