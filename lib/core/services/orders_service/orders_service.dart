import 'package:gainx/core/services/http_service/http_service.dart';
import 'package:gainx/core/services/orders_service/models.dart';

class OrdersService {
  OrdersService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<bool> submitOrder({
    required String assetName,
    required double loanAmount,
    required int monthDuration,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Order/SubmitOrder'),
      method: HttpMethod.post,
      body: {
        'tokenName': assetName,
        'tokenAmount': loanAmount,
        'monthDuration': monthDuration,
      },
    );

    return res is AppSuccessResponse;
  }

  Future<bool> dropOrder({required String orderId}) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Order/DropOrder'),
      method: HttpMethod.post,
      body: {
        'orderId': orderId,
      },
    );

    return res is AppSuccessResponse;
  }

  Future<List<HistoryOrder>> listOfOrders() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Order/GetAllUserOrders'),
      method: HttpMethod.post,
      body: {
        'pagination': {'page': 1, 'size': 100},
        'states': ['Registered']
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _process(data!),
      _ => [],
    };
  }

  Future<List<HistoryOrder>> listOfFinalizedOrders() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Order/GetAllUserOrders'),
      method: HttpMethod.post,
      body: {
        'pagination': {'page': 1, 'size': 100},
        'states': ['Drop', 'Paid']
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _process(data!),
      _ => [],
    };
  }

  Future<EffectivePriceModel?> effectivePrice({
    required String assetName,
    required double loanAmount,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Price/GetEffectivePrice'),
      body: {
        'tokenName': assetName,
        'tokenAmount': loanAmount,
      },
      method: HttpMethod.post,
    );

    return switch (res) {
      AppSuccessResponse(:final data) =>
        EffectivePriceModel.fromJson(data!['data'] as Map<String, dynamic>),
      _ => null,
    };
  }

  List<HistoryOrder> _process(Map<String, dynamic> json) {
    return ((json['data'] as Map<String, dynamic>)['data'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(HistoryOrder.fromJson)
        .toList();
  }
}
