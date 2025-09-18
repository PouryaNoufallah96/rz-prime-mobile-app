import 'dart:math' as math;
import 'package:intl/intl.dart';

class AppNumberFormatter {
  static double _truncateToDecimals(double x, int fractionDigits) {
    if (!x.isFinite) return x;
    final p = math.pow(10, fractionDigits);
    return (x * p).truncateToDouble() / p;
  }

  static String format(
    double value, {
    int? decimal,       // دقیقاً همین تعداد اعشار (اگر مقداردهی شد)
    int? maxDecimal,    // حداکثر اعشار قابل نمایش
  }) {
    int effectiveDecimal;

    if (decimal != null) {
      // اگر decimal صریح داده شده، همون رو استفاده کن
      effectiveDecimal = decimal;
    } else {
      // تعداد اعشار واقعی رو پیدا کن (بدون صفرهای آخر)
      final str = value.toString();
      if (!str.contains('.')) {
        effectiveDecimal = 0;
      } else {
        final cleaned = str.replaceFirst(RegExp(r'0+$'), '');
        effectiveDecimal = cleaned.split('.').last.length;
      }

      // اگر maxDecimal مشخص شده بود، محدودش کن
      if (maxDecimal != null && effectiveDecimal > maxDecimal) {
        effectiveDecimal = maxDecimal;
      }
    }

    final t = _truncateToDecimals(value, effectiveDecimal);

    return NumberFormat.currency(
      symbol: '',
      locale: 'en',
      decimalDigits: (t % 1 == 0) ? 0 : effectiveDecimal,
    ).format(t);
  }
}