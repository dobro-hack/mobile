// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'problem_back.dart';

part 'problem_response.freezed.dart';

part 'problem_response.g.dart';

@freezed
class ProblemResponse with _$ProblemResponse {
  @JsonSerializable(explicitToJson: true)
  const factory ProblemResponse({
    @JsonKey(name: 'TotalItemsCount') required int totalCount,
    @JsonKey(name: 'Items') required List<ProblemBack> problems,
  }) = _ProblemResponse;

  const ProblemResponse._();

  factory ProblemResponse.fromJson(Map<String, Object?> json) =>
      _$ProblemResponseFromJson(json);
}
