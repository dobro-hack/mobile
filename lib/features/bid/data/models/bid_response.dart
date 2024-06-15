// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'bid.dart';

part 'bid_response.freezed.dart';

part 'bid_response.g.dart';

@freezed
class BidResponse with _$BidResponse {
  @JsonSerializable(explicitToJson: true)
  const factory BidResponse({
    @JsonKey(name: 'TotalItemsCount') required int totalRoutesCount,
    @JsonKey(name: 'Items') required List<Bid> routes,
  }) = _BidResponse;

  const BidResponse._();

  factory BidResponse.fromJson(Map<String, Object?> json) =>
      _$BidResponseFromJson(json);
}
