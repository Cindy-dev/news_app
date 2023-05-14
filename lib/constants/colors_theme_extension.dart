import 'package:flutter/material.dart';

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  final Color primaryColor;
  final Color primaryColorDark;
  final Color green;
  final Color red;
  final Color yellow;
  final Color blue;
  final Color lighterBlue;
  final Color textBlack;

  /// Use context.theme.cardColor instead
  final Color white;
  final Color blueBg;

  ColorThemeExt(
      {required this.primaryColor,
      required this.primaryColorDark,
      required this.green,
      required this.red,
      required this.yellow,
      required this.blue,
      required this.lighterBlue,
      required this.white,
      required this.textBlack,
      required this.blueBg});
  @override
  ThemeExtension<ColorThemeExt> copyWith({
    Color? primaryColor,
    Color? primaryColorDark,
    Color? green,
    Color? red,
    Color? yellow,
    Color? blue,
    Color? lighterBlue,
    Color? textBlack,
    Color? white,
    Color? blueBg,
  }) {
    return ColorThemeExt(
      green: green ?? this.green,
      red: red ?? this.red,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      lighterBlue: lighterBlue ?? this.lighterBlue,
      textBlack: textBlack ?? this.textBlack,
      white: white ?? this.white,
      blueBg: blueBg ?? this.blueBg,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorDark: primaryColorDark ?? this.primaryColorDark,
    );
  }

  @override
  ThemeExtension<ColorThemeExt> lerp(
    covariant ThemeExtension<ColorThemeExt>? other,
    double t,
  ) {
    return this;
  }
}
