// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'coord.dart';
part 'place.freezed.dart';

part 'place.g.dart';

@freezed
class Place with _$Place {
  @JsonSerializable(explicitToJson: true)
  const factory Place({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'RouteID') required int routeId,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Description') required String description,
    @JsonKey(name: 'Icon') required String icon,
    @JsonKey(name: 'Location') required Coord location,
  }) = _Place;

  const Place._();

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}
