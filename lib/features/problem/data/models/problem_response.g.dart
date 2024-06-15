// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProblemResponseImpl _$$ProblemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProblemResponseImpl(
      totalCount: (json['TotalItemsCount'] as num).toInt(),
      problems: (json['Items'] as List<dynamic>)
          .map((e) => ProblemBack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProblemResponseImplToJson(
        _$ProblemResponseImpl instance) =>
    <String, dynamic>{
      'TotalItemsCount': instance.totalCount,
      'Items': instance.problems.map((e) => e.toJson()).toList(),
    };
