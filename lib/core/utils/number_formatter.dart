import 'package:intl/intl.dart';

class AppNumberFromatter {
  static String format(
    double value, {
    int? decimal,
  }) {
    return NumberFormat.currency(
      symbol: '',
      locale: 'en',
      decimalDigits: decimal,
    ).format(value);
  }
}
