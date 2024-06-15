// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_back.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProblemBackImpl _$$ProblemBackImplFromJson(Map<String, dynamic> json) =>
    _$ProblemBackImpl(
      id: (json['ID'] as num).toInt(),
      userId: (json['UserID'] as num).toInt(),
      sentAt: DateTime.parse(json['SentAt'] as String),
      type: $enumDecode(_$ProblemTypeEnumMap, json['Type']),
      message: json['Message'] as String,
      location:
          LocationProblem.fromJson(json['Location'] as Map<String, dynamic>),
      status: $enumDecode(_$ProblemStatusEnumMap, json['Status']),
      fileUrl: json['FileUrl'] as String,
      phone: json['Phone'] as String,
    );

Map<String, dynamic> _$$ProblemBackImplToJson(_$ProblemBackImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'UserID': instance.userId,
      'SentAt': instance.sentAt.toIso8601String(),
      'Type': _$ProblemTypeEnumMap[instance.type]!,
      'Message': instance.message,
      'Location': instance.location.toJson(),
      'Status': _$ProblemStatusEnumMap[instance.status]!,
      'FileUrl': instance.fileUrl,
      'Phone': instance.phone,
    };

const _$ProblemTypeEnumMap = {
  ProblemType.wasteDisposal: 'waste',
  ProblemType.waterPollution: 'waterPollution',
  ProblemType.air: 'air',
  ProblemType.animals: 'animals',
  ProblemType.reserve: 'reserve',
  ProblemType.treatment: 'treatment',
  ProblemType.waterAccess: 'waterAccess',
  ProblemType.other: 'other',
};

const _$ProblemStatusEnumMap = {
  ProblemStatus.pending: 'pending',
  ProblemStatus.delivered: 'delivered',
  ProblemStatus.notSend: 'notSend',
  ProblemStatus.declined: 'declined',
};
