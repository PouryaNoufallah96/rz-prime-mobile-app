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
    // اگر decimal نال بود خودش تعداد اعشار واقعی رو پیدا کنه
    int effectiveDecimal = decimal ??
        (() {
          final str = value.toString();
          if (!str.contains('.')) return 0;
          // حذف صفرهای آخر
          final cleaned = str.replaceFirst(RegExp(r'0+$'), '');
          return cleaned.split('.').last.length;
        })();

    final t = _truncateToDecimals(value, effectiveDecimal);

    return NumberFormat.currency(
      symbol: '',
      locale: 'en',
      decimalDigits: (t % 1 == 0) ? 0 : effectiveDecimal,
    ).format(t);
  }
}