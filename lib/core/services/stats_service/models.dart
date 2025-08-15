import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class InventoryModel with _$InventoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory InventoryModel({
    required String assetAddress,
    required String asseName,
    required double assetPrice,
    required double quantity,
    required double liquidityUsd,
    required double volume_24hUsd,
    required double poolFeeRate,
    required double reserveBaseUsd,
    required double reserveQuoteUsd,
    required String fakeAddress,
    required String lastUpdateDateTime,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}

@freezed
class UserStats with _$UserStats {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserStats({
    required double customerCredit,
    required double sumOfMining,
    required String userLevel,
    required List<String> accessibleStages,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}
