import 'package:gainx/core/services/http_service/http_service.dart';
import 'package:gainx/core/services/stats_service/models.dart';

class StatsService {
  StatsService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<UserStats?> userStats() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('states/user-stats'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) =>
        UserStats.fromJson(data!['data'] as Map<String, dynamic>),
      _ => null,
    };
  }

  Future<List<InventoryModel>> inventories() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('states/inventory'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _processInventories(data!),
      _ => []
    };
  }

  List<InventoryModel> _processInventories(Map<String, dynamic> json) {
    return (json['data'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(InventoryModel.fromJson)
        .toList();
  }
}
