import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'Status')
enum ProblemStatus {
  @JsonValue('pending')
  pending('На рассмотрении'),

  @JsonValue('delivered')
  delivered('Доставлено'),

  @JsonValue('notSend')
  notSend('Не отправлено'),

  @JsonValue('declined')
  declined('Отклонено');

  const ProblemStatus(this.name);

  final String name;
}
