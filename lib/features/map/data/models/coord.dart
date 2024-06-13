// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'coord.freezed.dart';

part 'coord.g.dart';

@freezed
class Coord with _$Coord {
  const factory Coord({
    required double lat,
    required double lon,
  }) = _Coord;

  const Coord._();

  factory Coord.fromJson(Map<String, Object?> json) => _$CoordFromJson(json);
}
