import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class CampaignBanner with _$CampaignBanner {
  const factory CampaignBanner({
    @Default(0) double discountPercentage,
    @Default(0) double minUSDValue,
    @Default(0) double maxUSDValue,
    @Default(0) double userUsedUSDValue,
    @Default(0) double userRemainingUSDValue,
    @Default(false) bool isAvailableForUser,
    @Default(0) int maxUsers,
    @Default(false) bool isWalletDiscount,
    String? campaignReference,
  }) = _CampaignBanner;

  factory CampaignBanner.fromJson(Map<String, dynamic> json) =>
      _$CampaignBannerFromJson(json);
}

extension CampaignBannerX on CampaignBanner {
  bool get isActive => discountPercentage > 0 && discountPercentage <= 100;

  bool appliesTo(double orderTotal) {
    if (!isActive || !isAvailableForUser) return false;
    if (orderTotal < minUSDValue) return false;
    if (maxUSDValue > 0 && orderTotal > maxUSDValue) return false;
    if (orderTotal > userRemainingUSDValue) return false;
    return true;
  }
}
