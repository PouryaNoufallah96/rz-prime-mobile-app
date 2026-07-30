// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampaignBanner _$CampaignBannerFromJson(Map<String, dynamic> json) =>
    _CampaignBanner(
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0,
      minUSDValue: (json['minUSDValue'] as num?)?.toDouble() ?? 0,
      maxUSDValue: (json['maxUSDValue'] as num?)?.toDouble() ?? 0,
      userUsedUSDValue: (json['userUsedUSDValue'] as num?)?.toDouble() ?? 0,
      userRemainingUSDValue:
          (json['userRemainingUSDValue'] as num?)?.toDouble() ?? 0,
      isAvailableForUser: json['isAvailableForUser'] as bool? ?? false,
      maxUsers: (json['maxUsers'] as num?)?.toInt() ?? 0,
      isWalletDiscount: json['isWalletDiscount'] as bool? ?? false,
      campaignReference: json['campaignReference'] as String?,
    );

Map<String, dynamic> _$CampaignBannerToJson(_CampaignBanner instance) =>
    <String, dynamic>{
      'discountPercentage': instance.discountPercentage,
      'minUSDValue': instance.minUSDValue,
      'maxUSDValue': instance.maxUSDValue,
      'userUsedUSDValue': instance.userUsedUSDValue,
      'userRemainingUSDValue': instance.userRemainingUSDValue,
      'isAvailableForUser': instance.isAvailableForUser,
      'maxUsers': instance.maxUsers,
      'isWalletDiscount': instance.isWalletDiscount,
      'campaignReference': instance.campaignReference,
    };
