import 'package:gainx/core/services/stats_service/models.dart';

const List<String> kAvailableTokens = [
  'REALESTATE',
  'CAR',
  'RZ',
  'LIFE',
  'INSURANCE',
  'MGC',
  'JEWELRY',
  'INDUSTRIAL',
  'TRIP',
  'CZW',
  'RP1',
  'COINBANK',
  'OASIS',
  'ZGC',
  'BTCR',
];

final Map<String, int> _availableTokenOrder = {
  for (var i = 0; i < kAvailableTokens.length; i++)
    kAvailableTokens[i].toUpperCase(): i,
};

extension AvailableTokensFilter on Iterable<InventoryModel> {
  List<InventoryModel> whereAvailable() {
    final filtered = where(
      (e) => _availableTokenOrder.containsKey(e.tokenName.toUpperCase()),
    ).toList()
      ..sort(
        (a, b) => _availableTokenOrder[a.tokenName.toUpperCase()]!
            .compareTo(_availableTokenOrder[b.tokenName.toUpperCase()]!),
      );

    return filtered;
  }
}
