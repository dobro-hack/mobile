// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'coord.dart';
part 'park.freezed.dart';

part 'park.g.dart';

@freezed
class Park with _$Park {
  @JsonSerializable(explicitToJson: true)
  const factory Park({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Description') required String description,
    @JsonKey(name: 'Area') required List<Coord> area,
  }) = _Park;

  const Park._();

  factory Park.fromJson(Map<String, Object?> json) => _$ParkFromJson(json);
}
