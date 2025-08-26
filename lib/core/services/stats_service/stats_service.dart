import 'package:gainx/core/services/http_service/http_service.dart';
import 'package:gainx/core/services/stats_service/models.dart';

class StatsService {
  StatsService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<List<UserStats>> userStats() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('User/GetUserStats'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) => (data!['data'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(UserStats.fromJson)
          .toList(),
      _ => [],
    };
  }

  Future<List<InventoryModel>> inventories() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Inventory/GetExistingTokensData'),
    );

    try {
      return switch (res) {
        AppSuccessResponse(:final data) => _processInventories(data!),
        _ => [],
      };
    } catch (e) {
      return [];
    }
  }

  List<InventoryModel> _processInventories(Map<String, dynamic> json) {
    final data = (json['data'] as Map<String, dynamic>)
        .values
        .cast<Map<String, dynamic>>();

    return data.map(
      (e) {
        final json = {...e, ...(e['price'] as Map<String, dynamic>)};
        return InventoryModel.fromJson(json);
      },
    ).toList();
  }
}
