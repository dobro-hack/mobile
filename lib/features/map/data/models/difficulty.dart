import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'Difficulty')
enum Difficulty {
  @JsonValue('easy')
  easy('Легко'),

  @JsonValue('medium')
  medium('Средне'),

  @JsonValue('hard')
  hard('Сложно');

  const Difficulty(this.name);

  final String name;

  // String getTranslation() => Tr.fromTranslationId(_translationId);
}
