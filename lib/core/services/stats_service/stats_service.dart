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
      _ => UserStats.fromJson(
          {
            'customer_credit': 1000.0,
            'sum_of_mining': 24,
            'user_level': 'regular',
            'accessible_stages': ['regular']
          },
        ),
    };
  }

  Future<List<InventoryModel>> inventories() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('states/inventory'),
    );

    return switch (res) {
      AppSuccessResponse(:final data) => _processInventories(data!),
      _ => _processInventories(inve),
    };
  }

  List<InventoryModel> _processInventories(Map<String, dynamic> json) {
    return (json['data'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map(InventoryModel.fromJson)
        .toList();
  }
}

final Map<String, Object> inve = {
  'message': 'Existing assets retrieved successfully',
  'data': [
    {
      'asset_address': '0x16a009f23333d5ae1db85a69cb231f85102c517c',
      'asset_name': 'RealEstate',
      'asset_price': 14.6855639,
      'quantity': 19834.248792,
      'liquidity_usd': 27274891.6413,
      'volume_24h_usd': 4776.4576374833,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 27274891.6413,
      'reserve_quote_usd': 27274891.6413,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:24:00'
    },
    {
      'asset_address': '0x73cf9558356b268507b8b1d1aaf752efc1cd1207',
      'asset_name': 'Car',
      'asset_price': 22.10647468,
      'quantity': 19934.2622020355,
      'liquidity_usd': 35786891.6984,
      'volume_24h_usd': 9704.8590109296,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 35786891.6984,
      'reserve_quote_usd': 35786891.6984,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:24:00'
    },
    {
      'asset_address': '0x771e1c638a9409bfc93158588f1745f638f4d10b',
      'asset_name': 'RZ',
      'asset_price': 67.72805893,
      'quantity': 19999.161364326,
      'liquidity_usd': 43936583.7664,
      'volume_24h_usd': 110814.117819266,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 43936583.7664,
      'reserve_quote_usd': 43936583.7664,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:24:00'
    },
    {
      'asset_address': '0x85cce3b0717b1ad14bf87b0130d2e58ece479ecb',
      'asset_name': 'Insurance',
      'asset_price': 88.56285217,
      'quantity': 19961.6206294129,
      'liquidity_usd': 62252437.9187,
      'volume_24h_usd': 3556.6350247532,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 62252437.9187,
      'reserve_quote_usd': 62252437.9187,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:24:00'
    },
    {
      'asset_address': '0xc08019eA4988bcCE9Dc4c2EE983E431a885d2f1A',
      'asset_name': 'MGC',
      'asset_price': 2.32749181,
      'quantity': 19393.014381323,
      'liquidity_usd': 1736203.8771,
      'volume_24h_usd': 106766.576400495,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 1736203.8771,
      'reserve_quote_usd': 1736203.8771,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:24:00'
    },
    {
      'asset_address': '0xd3f9cc1955b05a6c18e115bd1749a9784a7c4b87',
      'asset_name': 'Trip',
      'asset_price': 15.57126931,
      'quantity': 19909.224666,
      'liquidity_usd': 24824777.6996,
      'volume_24h_usd': 9354.0687632237,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 24824777.6996,
      'reserve_quote_usd': 24824777.6996,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:23:51'
    },
    {
      'asset_address': '0xd5916c07de3ffbb728a07e118fa89b5452ea9602',
      'asset_name': 'Industrial',
      'asset_price': 18.5576897,
      'quantity': 19989.173307,
      'liquidity_usd': 34385357.2927,
      'volume_24h_usd': 9472.3534417554,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 34385357.2927,
      'reserve_quote_usd': 34385357.2927,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:24:00'
    },
    {
      'asset_address': '0xd85df7190cdc09a42d7a2567f68812128c71e9a7',
      'asset_name': 'Jewelry',
      'asset_price': 25.4744662,
      'quantity': 19900.1074745288,
      'liquidity_usd': 46978033.1471,
      'volume_24h_usd': 12232.045151022,
      'pool_fee_rate': 0.0025,
      'reserve_base_usd': 46978033.1471,
      'reserve_quote_usd': 46978033.1471,
      'fake_address': '0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466',
      'last_update_date_time': '2025-08-15T07:23:52'
    }
  ],
  'context': {}
};
