// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid.freezed.dart';

part 'bid.g.dart';

@freezed
class Bid with _$Bid {
  @JsonSerializable(explicitToJson: true)
  const factory Bid({
    @JsonKey(name: 'route_id') required int routeId,
    @JsonKey(name: 'Quantity') required int quantity,
    @JsonKey(name: 'request_id') required String requestId,
    @JsonKey(name: 'date_start') required DateTime dateStart,
  }) = _Bid;

  const Bid._();

  factory Bid.fromJson(Map<String, Object?> json) => _$BidFromJson(json);
}
