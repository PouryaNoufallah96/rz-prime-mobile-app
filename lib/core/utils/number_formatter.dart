import 'dart:math' as math;

import 'package:intl/intl.dart';

class AppNumberFromatter {
  static double _truncateToDecimals(double x, int fractionDigits) {
    if (!x.isFinite) return x;
    final p = math.pow(10, fractionDigits);
    return (x * p).truncateToDouble() / p;
  }

  static String format(
    double value, {
    int? decimal,
  }) {
    final t = _truncateToDecimals(value, decimal ?? 0);

    return NumberFormat.currency(
      symbol: '',
      locale: 'en',
      decimalDigits: (t % 1 == 0) ? 0 : decimal,
    ).format(t);
  }
}
