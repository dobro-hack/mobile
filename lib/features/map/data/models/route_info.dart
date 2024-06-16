// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'difficulty.dart';
import 'park.dart';
import 'place.dart';
part 'route_info.freezed.dart';

part 'route_info.g.dart';

@freezed
class RouteInfo with _$RouteInfo {
  @JsonSerializable(explicitToJson: true)
  const factory RouteInfo({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'ParkID') required int parkId,
    @JsonKey(name: 'Park') required Park park,
    @JsonKey(name: 'Places') required List<Place>? places,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Description') required String description,
    @JsonKey(name: 'HowToGet') required String howToGet,
    @JsonKey(name: 'WhatToTake') required String whatToTake,
    @JsonKey(name: 'InEmergency') required String inEmergency,
    @JsonKey(name: 'Recommendations') required String recommendations,
    @JsonKey(name: 'Length') required int length,
    @JsonKey(name: 'Duration') required int duration,
    @JsonKey(name: 'Height') required int height,
    @JsonKey(name: 'Difficulty') required Difficulty difficulty,
    @JsonKey(name: 'Load') required List<int>? load,
    @JsonKey(name: 'MaxLoad') required int? maxLoad,
  }) = _RouteInfo;

  const RouteInfo._();

  factory RouteInfo.fromJson(Map<String, Object?> json) =>
      _$RouteInfoFromJson(json);
}
