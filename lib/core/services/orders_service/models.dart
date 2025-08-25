import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class HistoryOrder with _$HistoryOrder {
  const factory HistoryOrder({
    required String orderId,
    required String createdMoment,
    required String userPublicKey,
    required String walletAddress,
    required String userStageId,
    required String stage,
    required String tokenName,
    required double quantity,
    required String tokenNetwork,
    required String tokenAddress,
    required double tokenEffectivePrice,
    required double loanAmount,
    required double loanInterestAmount,
    required double finalAmount,
    required double profitRatePerMonth,
    required double monthDuration,
    required String payOffDate,
    required String tokenAmountInWei,
    required String payAmountInWei,
    required HistoryOrderState state,
  }) = _HistoryOrder;

  factory HistoryOrder.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderFromJson(json);
}

enum HistoryOrderState {
  @JsonValue('Registered')
  registed(),
  @JsonValue('Drop')
  drop(),
  @JsonValue('Paid ')
  paid();
}

@freezed
class FinalizedOrder with _$FinalizedOrder {
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
  const factory EffectivePriceModel({
    @Default(0) double marketPrice,
    @Default(0) double effectivePrice,
    @Default(0) double priceImpact,
    @Default(0) double totalCost,
    @Default(0) double bnbPriceUsd,
    @Default(0) double tokenReserve,
    @Default(0) double bnbReserve,
  }) = _EffectivePriceModel;

  factory EffectivePriceModel.fromJson(Map<String, dynamic> json) =>
      _$EffectivePriceModelFromJson(json);
}
