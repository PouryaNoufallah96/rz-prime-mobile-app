import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    required String tokenAddress,
    required String tokenName,
    required String tokenNetwork,
    required double price,
    required double quantity,
    required double liquidityUsd,
    required double volume24hUsd,
    required double reserveBaseUsd,
    required double reserveQuoteUsd,
    required double quoteTokenPriceUsd,
    required String fakeAddress,
    required String lastUpdated,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}

extension InventoryModelX on InventoryModel {
  String get imageSrc {
    return 'assets/images/${tokenName.toLowerCase()}.png';
  }
}

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    required UserStage stage,
    required double mining,
    required double availableLoanAmount,
    required double sumOfMining,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}

enum UserStage {
  @JsonValue('Regular')
  regular('Regular'),
  @JsonValue('Gold')
  gold('Gold'),
  @JsonValue('Premium')
  premium('Premium'),
  @JsonValue('X')
  x('X');

  const UserStage(this.value);
  final String value;
}

extension UserStatsX on UserStats {
  double get balance => availableLoanAmount + sumOfMining;
}
