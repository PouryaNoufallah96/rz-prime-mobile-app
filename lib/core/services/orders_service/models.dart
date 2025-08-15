import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class HistoryOrder with _$HistoryOrder {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HistoryOrder({
    required int id,
    required String asset,
    required String assetAddress,
    required String date,
    required double loanAmount,
    required double numberOfMonths,
    required String orderId,
    required String payoffDate,
    required double profitRatePerMonth,
    required double quantity,
    required String stage,
    required String time,
    required String walletAddress,
    required double assetPrice,
    required double finalAmount,
    required String registeredAmount,
    FinalizedOrder? finalizedOrder,
    String? transactionHash,
  }) = _HistoryOrder;

  factory HistoryOrder.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderFromJson(json);
}

@freezed
class FinalizedOrder with _$FinalizedOrder {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FinalizedOrder({
    required String paymentStatus,
    required double finalizedAmount,
    required String finalizedDate,
  }) = _FinalizedOrder;

  factory FinalizedOrder.fromJson(Map<String, dynamic> json) =>
      _$FinalizedOrderFromJson(json);
}

@freezed
class EffectivePriceModel with _$EffectivePriceModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EffectivePriceModel({
    required double effectiveRoughEstimationQuantity,
    required double effectivePrice,
  }) = _EffectivePriceModel;

  factory EffectivePriceModel.fromJson(Map<String, dynamic> json) =>
      _$EffectivePriceModelFromJson(json);
}
