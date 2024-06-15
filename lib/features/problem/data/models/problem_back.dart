// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'location_problem.dart';
import 'problem_data.dart';
import 'problem_status.dart';
import 'problem_type.dart';

part 'problem_back.freezed.dart';

part 'problem_back.g.dart';

// @freezed
// class ProblemBack with _$ProblemBack {
//   @JsonSerializable(explicitToJson: true)
//   const factory ProblemBack({
//     @JsonKey(name: 'ID') required int id,
//     @JsonKey(name: 'UserID') required int userId,
//     @JsonKey(name: 'SentAt') required DateTime sentAt,
//     @JsonKey(name: 'Type') required ProblemType type,
//     @JsonKey(name: 'Message') required String message,
//     @JsonKey(name: 'Location') required Coord location,
//     @JsonKey(name: 'Status') required ProblemStatus status,
//     @JsonKey(name: 'FileUrl') required String fileUrl,
//     @JsonKey(name: 'Phone') required String phone,
//   }) = _ProblemBack;

//   const ProblemBack._();

//   factory ProblemBack.fromJson(Map<String, Object?> json) =>
//       _$ProblemBackFromJson(json);
// }

@freezed
class ProblemBack with _$ProblemBack implements ProblemData {
  @JsonSerializable(explicitToJson: true)
  const factory ProblemBack({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'SentAt') required DateTime sentAt,
    @JsonKey(name: 'Type') required ProblemType type,
    @JsonKey(name: 'Message') required String message,
    @JsonKey(name: 'Location') required LocationProblem location,
    @JsonKey(name: 'Status') required ProblemStatus status,
    @JsonKey(name: 'FileUrl') required String fileUrl,
    @JsonKey(name: 'Phone') required String phone,
  }) = _ProblemBack;

  const ProblemBack._();

  factory ProblemBack.fromJson(Map<String, Object?> json) =>
      _$ProblemBackFromJson(json);
}
