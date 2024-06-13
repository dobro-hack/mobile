import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'type')
enum ProblemType {
  @JsonValue('waste')
  wasteDisposal('Незаконная утилизация отходов'),

  @JsonValue('waterPollution')
  waterPollution('Загрязнение воды'),

  @JsonValue('air')
  air('Загрязнение воздуха'),

  @JsonValue('animals')
  animals('Нарушение законодательства о животном мире'),

  @JsonValue('reserve')
  reserve('Нарушение в заповедной зоне'),

  @JsonValue('treatment')
  treatment('Нарушение при эксплуатации очистных сооружений'),

  @JsonValue('waterAccess')
  waterAccess('Незаконное ограничение доступа к воде'),

  @JsonValue('other')
  other('Иное');

  const ProblemType(this.name);

  final String name;
}
