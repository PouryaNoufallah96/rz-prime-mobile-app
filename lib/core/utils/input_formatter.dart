// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/services.dart';

class SwapAmountFormatter extends TextInputFormatter {
  SwapAmountFormatter({
    this.maxDecimals = 6,
    this.decimalSeparator = '.',
    this.groupingSeparator = ',',
    this.useGrouping = true,
    this.allowNegative = false,
    this.min,
    this.max,
    this.normalizeLeadingZeroes = true,
    this.zeroWhenEmpty = true,
  });

  final int maxDecimals;
  final String decimalSeparator;
  final String groupingSeparator;
  final bool useGrouping;
  final bool allowNegative;
  final String? max;
  final String? min;
  final bool normalizeLeadingZeroes;
  final bool zeroWhenEmpty;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var t = newValue.text;

    // برای تشخیص اینکه فقط '-' تایپ شده
    final typedOnlyMinus = allowNegative && newValue.text == '-';

    final allowed = RegExp(
      '[0-9${RegExp.escape(decimalSeparator)}${RegExp.escape(groupingSeparator)}${allowNegative ? '-' : ''}]',
    );
    t = t.split('').where(allowed.hasMatch).join();

    var hasSign = false;
    if (allowNegative && t.contains('-')) {
      hasSign = t.startsWith('-');
      t = t.replaceAll('-', '');
    }

    t = t.replaceAll(groupingSeparator, '');

    final firstSep = t.indexOf(decimalSeparator);
    if (firstSep != -1) {
      final before = t.substring(0, firstSep + 1);
      final after = t.substring(firstSep + 1).replaceAll(decimalSeparator, '');
      t = before + after;
    }

    if (t.startsWith(decimalSeparator)) {
      t = '0$decimalSeparator${t.substring(1)}';
    }

    if (normalizeLeadingZeroes) {
      t = _stripLeadingZeros(t);
    }

    final sepIndex = t.indexOf(decimalSeparator);
    if (sepIndex != -1) {
      final frac = t.substring(sepIndex + 1);
      if (frac.length > maxDecimals) {
        t = t.substring(0, sepIndex + 1 + maxDecimals);
      }
    }

    if (hasSign) t = '-$t';

    // ✅ اگر خالی شد، 0 بذار (مگر اینکه کاربر فقط '-' زده باشد)
    if (t.isEmpty) {
      if (typedOnlyMinus) {
        return newValue.copyWith(
          text: '-',
          selection: const TextSelection.collapsed(offset: 1),
        );
      }
      if (zeroWhenEmpty) {
        var result = _formatForDisplay('0');
        result =
            _clampIfNeeded(result); // اگر min>0 داری، ممکنه به min کلَمپ شود
        return TextEditingValue(
          text: result,
          selection: TextSelection.collapsed(offset: result.length),
        );
      } else {
        return newValue.copyWith(
          text: t,
          selection: const TextSelection.collapsed(offset: 0),
        );
      }
    }

    final endsWithSep = t.endsWith(decimalSeparator);
    String intPart;
    var fracPart = '';
    final idx = t.indexOf(decimalSeparator);
    final signed = hasSign ? '-' : '';
    if (idx == -1) {
      intPart = hasSign ? t.substring(1) : t;
    } else {
      intPart = hasSign ? t.substring(1, idx) : t.substring(0, idx);
      if (!endsWithSep) {
        fracPart = t.substring(idx + 1);
      }
    }

    final groupedInt = useGrouping ? _addGrouping(intPart) : intPart;

    String result;
    if (endsWithSep) {
      result = '$signed$groupedInt$decimalSeparator';
    } else if (idx == -1) {
      result = '$signed$groupedInt';
    } else {
      result = '$signed$groupedInt$decimalSeparator$fracPart';
    }

    result = _clampIfNeeded(result);

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }

  String _stripLeadingZeros(String s) {
    final sep = decimalSeparator;
    final sign = s.startsWith('-') ? '-' : '';
    var body = sign.isNotEmpty ? s.substring(1) : s;

    if (!body.startsWith('0')) return s;

    final i = body.indexOf(sep);
    if (i == -1) {
      body = body.replaceFirst(RegExp('^0+'), '');
      if (body.isEmpty) body = '0';
      return sign + body;
    } else {
      var intPart = body.substring(0, i).replaceFirst(RegExp('^0+'), '');
      if (intPart.isEmpty) intPart = '0';
      return sign + intPart + body.substring(i);
    }
  }

  String _addGrouping(String digits) {
    if (digits.length <= 3) return digits;
    final buf = StringBuffer();
    var count = 0;
    for (var i = digits.length - 1; i >= 0; i--) {
      buf.write(digits[i]);
      count++;
      if (count == 3 && i != 0) {
        buf.write(groupingSeparator);
        count = 0;
      }
    }
    return buf.toString().split('').reversed.join();
  }

  String _removeGrouping(String x) => x.replaceAll(groupingSeparator, '');

  String _clampIfNeeded(String value) {
    final raw = _removeGrouping(value);
    String applyPrecision(String x) {
      final i = x.indexOf(decimalSeparator);
      if (i == -1) return x;
      final frac = x.substring(i + 1);
      if (frac.length <= maxDecimals) return x;
      return x.substring(0, i + 1 + maxDecimals);
    }

    var ret = value;

    if (max != null && _compare(raw, _removeGrouping(max!)) > 0) {
      ret = _formatForDisplay(applyPrecision(_removeGrouping(max!)));
    } else if (min != null && _compare(raw, _removeGrouping(min!)) < 0) {
      ret = _formatForDisplay(applyPrecision(_removeGrouping(min!)));
    }

    final dot = ret.indexOf(decimalSeparator);
    if (dot != -1 && !ret.endsWith(decimalSeparator)) {
      final sign = ret.startsWith('-') ? '-' : '';
      final noSign = sign.isNotEmpty ? ret.substring(1) : ret;
      final i = noSign.indexOf(decimalSeparator);
      final intPart = noSign.substring(0, i).replaceAll(groupingSeparator, '');
      final frac = noSign.substring(i + 1).replaceFirst(RegExp(r'0+$'), '');
      final groupedInt = useGrouping ? _addGrouping(intPart) : intPart;
      ret = frac.isEmpty
          ? '$sign$groupedInt'
          : '$sign$groupedInt$decimalSeparator$frac';
    }

    return ret;
  }

  String _formatForDisplay(String raw) {
    final sign = raw.startsWith('-') ? '-' : '';
    final noSign = sign.isNotEmpty ? raw.substring(1) : raw;
    final i = noSign.indexOf(decimalSeparator);
    String intPart;
    var fracPart = '';
    if (i == -1) {
      intPart = noSign;
    } else {
      intPart = noSign.substring(0, i);
      fracPart = noSign.substring(i + 1);
    }
    final groupedInt = useGrouping ? _addGrouping(intPart) : intPart;
    return fracPart.isEmpty
        ? '$sign$groupedInt'
        : '$sign$groupedInt$decimalSeparator$fracPart';
  }

  int _compare(String a, String b) {
    bool neg(String x) => x.startsWith('-');
    final sa = neg(a);
    final sb = neg(b);
    if (sa != sb) return sa ? -1 : 1;
    final sign = sa ? -1 : 1;

    String stripLeadZeros(String x) {
      final s = x.startsWith('-') ? x.substring(1) : x;
      final i = s.indexOf(decimalSeparator);
      if (i == -1) {
        final n = s.replaceFirst(RegExp('^0+'), '');
        return (x.startsWith('-') ? '-' : '') + (n.isEmpty ? '0' : n);
      } else {
        var intPart = s.substring(0, i).replaceFirst(RegExp('^0+'), '');
        if (intPart.isEmpty) intPart = '0';
        final frac = s.substring(i + 1).replaceFirst(RegExp(r'0+$'), '');
        return (x.startsWith('-') ? '-' : '') +
            intPart +
            (frac.isEmpty ? '' : '$decimalSeparator$frac');
      }
    }

    List<String> parts(String x) {
      final s = stripLeadZeros(x);
      final neg = s.startsWith('-');
      final body = neg ? s.substring(1) : s;
      final i = body.indexOf(decimalSeparator);
      if (i == -1) return [body, ''];
      return [body.substring(0, i), body.substring(i + 1)];
    }

    final pa = parts(a);
    final pb = parts(b);

    if (pa[0].length != pb[0].length) {
      return sign * (pa[0].length > pb[0].length ? 1 : -1);
    }
    final ic = pa[0].compareTo(pb[0]);
    if (ic != 0) return sign * (ic > 0 ? 1 : -1);

    final L = pa[1].length > pb[1].length ? pa[1].length : pb[1].length;
    final fa = pa[1].padRight(L, '0');
    final fb = pb[1].padRight(L, '0');
    final fc = fa.compareTo(fb);
    if (fc == 0) return 0;
    return sign * (fc > 0 ? 1 : -1);
  }
}
