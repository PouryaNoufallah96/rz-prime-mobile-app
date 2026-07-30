// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';

class GainXTheme {
  ThemeData call(bool isDark) {
    final scheme = GainXColorScheme.getScheme(isDark);

    return ThemeData(
      colorScheme: scheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xff121314),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide(color: scheme.error),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide(color: scheme.error),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(80),
          borderSide: BorderSide.none,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xff202023),
        space: 48,
      ),
      extensions: [
        ColorExtension(),
      ],
    );
  }
}

class GainXColorScheme {
  static final ColorScheme _dark = ColorScheme.dark(
    primary: GainXColors.blue,
    outline: GainXColors.grey.shade900,
    outlineVariant: GainXColors.grey.shade900,
    error: GainXColors.red.shade700,
  );

  static final ColorScheme _light = ColorScheme.light(
    primary: GainXColors.blue,
    outlineVariant: GainXColors.grey.shade300,
    error: GainXColors.red,
  );

  static ColorScheme getScheme(bool isDark) {
    return isDark ? _dark : _light;
  }
}

class ColorExtension extends ThemeExtension<ColorExtension> {
  ColorExtension({
    this.primary = GainXColors.blue,
    this.success = GainXColors.green,
    this.error = GainXColors.red,
    this.neutral = GainXColors.grey,
    this.promo = GainXColors.purple,
  });

  final ColorSwatch<int> success;
  final ColorSwatch<int> error;
  final ColorSwatch<int> primary;
  final ColorSwatch<int> neutral;
  final ColorSwatch<int> promo;

  @override
  ColorExtension lerp(ColorExtension? other, double t) {
    return ColorExtension(
      success: ColorSwatch.lerp(success, other?.success, t)!,
      error: ColorSwatch.lerp(error, other?.error, t)!,
      primary: ColorSwatch.lerp(primary, other?.primary, t)!,
      neutral: ColorSwatch.lerp(neutral, other?.neutral, t)!,
      promo: ColorSwatch.lerp(promo, other?.promo, t)!,
    );
  }

  @override
  ColorExtension copyWith({
    ColorSwatch<int>? success,
    ColorSwatch<int>? error,
    ColorSwatch<int>? primary,
    ColorSwatch<int>? neutral,
    ColorSwatch<int>? promo,
  }) {
    return ColorExtension(
      success: success ?? this.success,
      error: error ?? this.error,
      primary: primary ?? this.primary,
      neutral: neutral ?? this.neutral,
      promo: promo ?? this.promo,
    );
  }
}

class ColorShades extends ColorSwatch<int> {
  const ColorShades(super.blue, super.swatch);

  Color get shade50 => this[50]!;

  Color get shade100 => this[100]!;

  Color get shade200 => this[200]!;

  Color get shade300 => this[300]!;

  Color get shade400 => this[400]!;

  Color get shade500 => this[500]!;

  Color get shade600 => this[600]!;

  Color get shade700 => this[700]!;

  Color get shade800 => this[800]!;

  Color get shade900 => this[900]!;

  Color get shade950 => this[950]!;
}

class GainXColors {
  static const int _blueValue = 0xFF4EA1FF;
  static const blue = ColorShades(
    _blueValue,
    <int, Color>{
      50: Color(0xffEEF6FF),
      100: Color(0xffDAEBFF),
      200: Color(0xffBDDCFF),
      300: Color(0xff90C7FF),
      400: Color(_blueValue),
      500: Color(0xff3585FC),
      600: Color(0xff1F65F1),
      700: Color(0xff174FDE),
      800: Color(0xff1941B4),
      900: Color(0xff1A3A8E),
      950: Color(0xff152556),
    },
  );

  static const int _greenValue = 0xFF22C55E;
  static const green = ColorShades(
    _greenValue,
    <int, Color>{
      50: Color(0xffF0FDF4),
      100: Color(0xffDCFCE7),
      200: Color(0xffBBF7D0),
      300: Color(0xff86EFAC),
      400: Color(0xff4ADE80),
      500: Color(_greenValue),
      600: Color(0xff16A34A),
      700: Color(0xff15803D),
      800: Color(0xff166534),
      900: Color(0xff0E2522),
      950: Color(0xff052E16),
    },
  );

  static const int _redValue = 0xFFEF4444;
  static const red = ColorShades(
    _redValue,
    <int, Color>{
      50: Color(0xffFEF2F2),
      100: Color(0xffFEE2E2),
      200: Color(0xffFECACA),
      300: Color(0xffFCA5A5),
      400: Color(0xffF87171),
      500: Color(_redValue),
      600: Color(0xffDC2626),
      700: Color(0xffB91C1C),
      800: Color(0xff991B1B),
      900: Color(0xff7F1D1D),
      950: Color(0xff450A0A),
    },
  );

  static const int _purpleValue = 0xFFA855F7;
  static const purple = ColorShades(
    _purpleValue,
    <int, Color>{
      50: Color(0xffFAF5FF),
      100: Color(0xffF3E8FF),
      200: Color(0xffE9D5FF),
      300: Color(0xffD8B4FE),
      400: Color(0xffC084FC),
      500: Color(_purpleValue),
      600: Color(0xff9333EA),
      700: Color(0xff7E22CE),
      800: Color(0xff6B21A8),
      900: Color(0xff581C87),
      950: Color(0xff3B0764),
    },
  );

  static const int _greyValue = 0xFF71717A;
  static const grey = ColorShades(
    _greyValue,
    <int, Color>{
      50: Color(0xffFAFAFA),
      100: Color(0xffF4F4F5),
      200: Color(0xffE4E4E7),
      300: Color(0xffD4D4D8),
      400: Color(0xffA1A1AA),
      500: Color(_greyValue),
      600: Color(0xff52525B),
      700: Color(0xff3F3F46),
      800: Color(0xff27272A),
      900: Color(0xff18181B),
      950: Color(0xff09090B),
    },
  );
}
