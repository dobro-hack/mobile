// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

part 'person.g.dart';

// int? iD;
// String? requestId;
// String? firstName;
// String? middleName;
// String? lastName;
// String? sitizen;
// String? region;
// String? gender;
// String? passport;
// String? birthday;
// String? phone;
// String? email;
// bool? isLeader;

@freezed
class Person with _$Person {
  @JsonSerializable(explicitToJson: true)
  const factory Person({
    @JsonKey(name: 'request_id') required int requestId,
    // @JsonKey(name: 'Quantity') required int quantity,
    // @JsonKey(name: 'RequestId') required String requestId,
    // @JsonKey(name: 'DateStart') required DateTime dateStart,
  }) = _Person;

  const Person._();

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}
