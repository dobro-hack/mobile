import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'Type')
enum ProblemType {
  @JsonValue('waste')
  wasteDisposal(
    'Незаконная утилизация отходов',
    'waste',
  ),

  @JsonValue('waterPollution')
  waterPollution(
    'Загрязнение воды',
    'waterPollution',
  ),

  @JsonValue('air')
  air(
    'Загрязнение воздуха',
    'air',
  ),

  @JsonValue('animals')
  animals(
    'Нарушение законодательства о животном мире',
    'animals',
  ),

  @JsonValue('reserve')
  reserve(
    'Нарушение в заповедной зоне',
    'reserve',
  ),

  @JsonValue('treatment')
  treatment(
    'Нарушение при эксплуатации очистных сооружений',
    'treatment',
  ),

  @JsonValue('waterAccess')
  waterAccess(
    'Незаконное ограничение доступа к воде',
    'waterAccess',
  ),

  @JsonValue('other')
  other(
    'Иное',
    'other',
  );

  const ProblemType(
    this.name,
    this.jsonName,
  );

  final String name;
  final String jsonName;
}
