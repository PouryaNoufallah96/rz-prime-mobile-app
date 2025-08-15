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

  Future<bool> dropOrder({required int orderId}) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('order/drop-order'),
      method: HttpMethod.post,
      body: {
        'order_id': orderId,
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
      _ => _process(orders),
    };
  }

  Future<List<HistoryOrder>> listOfFinalizedOrders() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('order/ist-of-finalized-orders'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _process(data!),
      _ => _process(orders),
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
      _ => EffectivePriceModel.fromJson({
          'effective_rough_estimation_quantity': 0.0686651479265994,
          'effective_price': 14.563428903829994
        }),
    };
  }

  List<HistoryOrder> _process(Map<String, dynamic> json) {
    return (json['data'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(HistoryOrder.fromJson)
        .toList();
  }
}

final Map<String, Object> orders = {
  'message': 'List of finalized orders',
  'data': [
    {
      'id': 487,
      'asset': 'RZ',
      'asset_address': '0x771e1c638a9409bfc93158588f1745f638f4d10b',
      'date': '2025-08-15',
      'loan_amount': 11.0,
      'number_of_months': 1,
      'order_id': 'ORD000373',
      'payoff_date': '2025-09-15',
      'profit_rate_per_month': 0.33,
      'promotion': null,
      'quantity': 0.161842674,
      'stage': 'regular',
      'time': '07:11:33',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 67.79730581,
      'final_amount': 11.33,
      'registered_amount': '11330000000000000000',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'Drop',
        'finalized_amount': 11.33,
        'finalized_date': '2025-08-15'
      }
    },
    {
      'id': 488,
      'asset': 'Car',
      'asset_address': '0x73cf9558356b268507b8b1d1aaf752efc1cd1207',
      'date': '2025-08-15',
      'loan_amount': 111.0,
      'number_of_months': 1,
      'order_id': 'ORD000374',
      'payoff_date': '2025-09-15',
      'profit_rate_per_month': 3.33,
      'promotion': null,
      'quantity': 5.008925609,
      'stage': 'regular',
      'time': '07:15:12',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 22.10497162,
      'final_amount': 114.33,
      'registered_amount': '114330000000000000000',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'Drop',
        'finalized_amount': 114.33,
        'finalized_date': '2025-08-15'
      }
    },
    {
      'id': 489,
      'asset': 'MGC',
      'asset_address': '0xc08019eA4988bcCE9Dc4c2EE983E431a885d2f1A',
      'date': '2025-08-15',
      'loan_amount': 111.0,
      'number_of_months': 6,
      'order_id': 'ORD000375',
      'payoff_date': '2026-02-15',
      'profit_rate_per_month': 19.98,
      'promotion': null,
      'quantity': 47.568564677,
      'stage': 'regular',
      'time': '07:20:53',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 2.32749181,
      'final_amount': 130.98,
      'registered_amount': '130979999999999983616',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'SDD',
        'finalized_amount': 130.98,
        'finalized_date': '2025-08-15'
      }
    },
    {
      'id': 490,
      'asset': 'RZ',
      'asset_address': '0x771e1c638a9409bfc93158588f1745f638f4d10b',
      'date': '2025-08-15',
      'loan_amount': 111.0,
      'number_of_months': 2,
      'order_id': 'ORD000376',
      'payoff_date': '2025-10-15',
      'profit_rate_per_month': 6.66,
      'promotion': null,
      'quantity': 1.6320817398,
      'stage': 'regular',
      'time': '07:44:14',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 67.84110025,
      'final_amount': 117.66,
      'registered_amount': '117660000000000016384',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'SDD',
        'finalized_amount': 117.66,
        'finalized_date': '2025-08-15'
      }
    },
    {
      'id': 484,
      'asset': 'Car',
      'asset_address': '0x73cf9558356b268507b8b1d1aaf752efc1cd1207',
      'date': '2025-08-14',
      'loan_amount': 1.0,
      'number_of_months': 1,
      'order_id': 'ORD000370',
      'payoff_date': '2025-09-14',
      'profit_rate_per_month': 0.03,
      'promotion': null,
      'quantity': 0.046215542,
      'stage': 'regular',
      'time': '17:23:46',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 21.58364759,
      'final_amount': 1.03,
      'registered_amount': '1030000000000000000',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'SDD',
        'finalized_amount': 1.03,
        'finalized_date': '2025-08-14'
      }
    },
    {
      'id': 485,
      'asset': 'Car',
      'asset_address': '0x73cf9558356b268507b8b1d1aaf752efc1cd1207',
      'date': '2025-08-14',
      'loan_amount': 1.0,
      'number_of_months': 1,
      'order_id': 'ORD000371',
      'payoff_date': '2025-09-14',
      'profit_rate_per_month': 0.03,
      'promotion': null,
      'quantity': 0.046215542,
      'stage': 'regular',
      'time': '17:23:58',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 21.58364759,
      'final_amount': 1.03,
      'registered_amount': '1030000000000000000',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'Drop',
        'finalized_amount': 1.03,
        'finalized_date': '2025-08-14'
      }
    },
    {
      'id': 486,
      'asset': 'RealEstate',
      'asset_address': '0x16a009f23333d5ae1db85a69cb231f85102c517c',
      'date': '2025-08-14',
      'loan_amount': 1.0,
      'number_of_months': 3,
      'order_id': 'ORD000372',
      'payoff_date': '2025-11-14',
      'profit_rate_per_month': 0.09,
      'promotion': null,
      'quantity': 0.0693145188,
      'stage': 'regular',
      'time': '17:24:21',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 14.39092386,
      'final_amount': 1.09,
      'registered_amount': '1090000000000000128',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'Drop',
        'finalized_amount': 1.09,
        'finalized_date': '2025-08-14'
      }
    },
    {
      'id': 483,
      'asset': 'Car',
      'asset_address': '0x73cf9558356b268507b8b1d1aaf752efc1cd1207',
      'date': '2025-08-14',
      'loan_amount': 111.0,
      'number_of_months': 1,
      'order_id': 'ORD000369',
      'payoff_date': '2025-09-14',
      'profit_rate_per_month': 3.33,
      'promotion': null,
      'quantity': 5.1291360792,
      'stage': 'regular',
      'time': '16:55:15',
      'user_id': 188,
      'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
      'asset_price': 21.58690027,
      'final_amount': 114.33,
      'registered_amount': '114330000000000000000',
      'customer': {'id': 188, 'name': null, 'email': null, 'phone': null},
      'auth_user': {
        'wallet_address': '0x28cf65cb793253cfcb07ae1b293287ceb1ba856a',
        'email': null,
        'username': null
      },
      'transaction_hash': null,
      'finalized_order': {
        'payment_status': 'Drop',
        'finalized_amount': 114.33,
        'finalized_date': '2025-08-14'
      }
    }
  ],
  'context': {}
};
