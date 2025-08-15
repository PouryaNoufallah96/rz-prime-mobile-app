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
    required String payOffDate,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('order/submit'),
      method: HttpMethod.post,
      body: {
        'asset_name': assetName,
        'loan_amount': loanAmount,
        'pay_off_date': payOffDate,
      },
    );

    return res is AppSuccessResponse;
  }

  Future<List<HistoryOrder>> listOfOrders() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('order/list-of-orders'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _process(data!),
      _ => []
    };
  }

  Future<List<HistoryOrder>> listOfFinalizedOrders() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('order/list-of-orders'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _process(data!),
      _ => []
    };
  }

  Future<EffectivePriceModel?> effectivePrice({
    required String assetName,
    required double loanAmount,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse(
          'order/effective-price-calculator?loan_amount=$loanAmount&asset_name=$assetName'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) =>
        EffectivePriceModel.fromJson(data!['data'] as Map<String, dynamic>),
      _ => null,
    };
  }

  List<HistoryOrder> _process(Map<String, dynamic> json) {
    return (json['data'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(HistoryOrder.fromJson)
        .toList();
  }
}
