import 'package:gainx/core/services/http_service/http_service.dart';
import 'package:gainx/core/services/orders_service/models.dart';

class OrdersService {
  OrdersService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<bool> submitOrder({
    required String selectedStage,
    required String assetName,
    required double loanAmount,
    required int monthDuration,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Order/SubmitOrder'),
      method: HttpMethod.post,
      body: {
        'selectedStage': selectedStage,
        'tokenName': assetName,
        'usdtAmount': loanAmount,
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

  Future<(List<HistoryOrder> data, int totalCount)> listOfFinalizedOrders(
      int page) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Order/GetAllUserOrders'),
      method: HttpMethod.post,
      body: {
        'pagination': {'page': page, 'size': 24},
        'states': ['Drop', 'Paid']
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) => (
          _process(data!),
          (data['data'] as Map<String, dynamic>)['totalCount'] as int
        ),
      _ => (<HistoryOrder>[], -1),
    };
  }

  Future<double?> effectivePrice({
    required String assetName,
    required double loanAmount,
  }) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Price/GetSwapAmount'),
      body: {
        'tokenName': assetName,
        'usdtAmount': loanAmount,
      },
      method: HttpMethod.post,
    );

    return switch (res) {
      AppSuccessResponse(:final data) => data!['data'] as double?,
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
