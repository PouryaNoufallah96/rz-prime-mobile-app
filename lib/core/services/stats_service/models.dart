import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gainx/pages/swap/blocs/swap/swap_bloc.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    required String tokenName,
    required String tokenNetwork,
    required double price,
    required double quantity,
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
  regular('Regular', 100, 1000, 0.03),
  @JsonValue('Gold')
  gold('Gold', 1100, 10000, 0.03),
  @JsonValue('Premium')
  premium('Premium', 10100, 100000, 0.02),
  @JsonValue('X')
  x('X', 100100, 1000000, 0.01);

  const UserStage(
    this.value,
    this.min,
    this.max,
    this.feePercent,
  );

  final String value;
  final double min;
  final double max;
  final double feePercent;
}

extension UserStatsX on UserStats {
  double get balance => availableLoanAmount + sumOfMining;
}

extension UserStageX on UserStage {
  List<SwapPayOfTime> stages() {
    return switch (this) {
      UserStage.x => [
          SwapPayOfTime.one,
        ],
      UserStage.premium => [
          SwapPayOfTime.one,
          SwapPayOfTime.two,
          SwapPayOfTime.three,
        ],
      _ => [...SwapPayOfTime.values],
    };
  }
}
