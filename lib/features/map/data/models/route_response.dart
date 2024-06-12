// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'route_info.dart';

part 'route_response.freezed.dart';

part 'route_response.g.dart';

@freezed
class RouteResponse with _$RouteResponse {
  @JsonSerializable(explicitToJson: true)
  const factory RouteResponse({
    @JsonKey(name: 'TotalItemsCount') required int totalRoutesCount,
    @JsonKey(name: 'Items') required List<RouteInfo> routes,
  }) = _RouteResponse;

  const RouteResponse._();

  factory RouteResponse.fromJson(Map<String, Object?> json) =>
      _$RouteResponseFromJson(json);
}
