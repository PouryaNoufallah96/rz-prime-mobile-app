import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class HistoryOrder with _$HistoryOrder {
  const factory HistoryOrder({
    required String orderId,
    required String createdMoment,
    required String walletAddress,
    required String userStageId,
    required String stage,
    required String tokenName,
    required String tokenNetwork,
    required String tokenAddress,
    required String payOffDate,
    required String tokenAmountInWei,
    required String payAmountInWei,
    required double quantity,
    required double tokenEffectivePrice,
    required double loanAmount,
    required double loanInterestAmount,
    required double finalAmount,
    required double profitRatePerMonth,
    required double monthDuration,
    required HistoryOrderState state,
    @Default([]) List<TransactionMetaData> transactionsMetaData,
    String? campaignReference,
    double? campaignDiscount,
  }) = _HistoryOrder;

  factory HistoryOrder.fromJson(Map<String, dynamic> json) =>
      _$HistoryOrderFromJson(json);
}

extension HistoryOrderX on HistoryOrder {
  bool get hasCampaignDiscount =>
      campaignDiscount != null &&
      campaignDiscount! > 0 &&
      campaignDiscount! <= 100;

  String get campaignDiscountLabel {
    final value = campaignDiscount ?? 0;
    return value == value.roundToDouble() ? value.toStringAsFixed(0) : '$value';
  }

  String get campaignDiscountApplied =>
      '$campaignDiscountLabel% discount applied';

  String get campaignDiscountMessage =>
      'Your order has received a $campaignDiscountLabel% campaign discount.';

  double get originalAmount {
    if (!hasCampaignDiscount) return finalAmount;
    return finalAmount / (1 - campaignDiscount! / 100);
  }
}

@freezed
abstract class TransactionMetaData with _$TransactionMetaData {
  const factory TransactionMetaData({
    required String createMoment,
    required String hash,
    required String status,
  }) = _TransactionMetaData;

  factory TransactionMetaData.fromJson(Map<String, dynamic> json) =>
      _$TransactionMetaDataFromJson(json);
}

enum HistoryOrderState {
  @JsonValue('Registered')
  registed(),
  @JsonValue('Drop')
  drop(),
  @JsonValue('Paid')
  paid();
}

@freezed
abstract class FinalizedOrder with _$FinalizedOrder {
  const factory FinalizedOrder({
    required String paymentStatus,
    required double finalizedAmount,
    required String finalizedDate,
  }) = _FinalizedOrder;

  factory FinalizedOrder.fromJson(Map<String, dynamic> json) =>
      _$FinalizedOrderFromJson(json);
}

@freezed
abstract class EffectivePriceModel with _$EffectivePriceModel {
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
