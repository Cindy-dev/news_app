library theme;

import 'package:flutter/material.dart';
import 'colors_theme_extension.dart';
part 'app_colors.dart';
part 'app_fonts.dart';
part 'text_styles.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = _Colors.primaryColor;
  const Color secondaryColor = _Colors.primaryColorDark;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: _Colors.red,
  );
  final themeData = ThemeData(
    // brightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorDark: secondaryColor,
    scaffoldBackgroundColor: _Colors.scaffoldColor,
    cardColor: _Colors.white,
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _Colors.scaffoldColor,
      centerTitle: true,
      elevation: 0,
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: AppTextStyles.body2Regular,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        backgroundColor: _Colors.blue,
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: _Colors.darkBlue),
        ),
        elevation: 0,
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.blue),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.blue),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: _Colors.grey),
      ),
      isDense: true,
      hintStyle: TextStyle(fontSize: 16, color: _Colors.grey),
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyles.body2Regular,
      displayLarge: AppTextStyles.displayLargeDarkBlack,
      titleMedium: AppTextStyles.subtitle1,
      headlineMedium: AppTextStyles.headingMediumTextBlack,
      bodySmall: AppTextStyles.captionBlack,
    ),
    extensions: [
      ColorThemeExt(
        green: _Colors.green,
        red: _Colors.red,
        yellow: _Colors.yellow,
        blue: _Colors.blue,
        white: _Colors.white,
        textBlack: _Colors.textBlack,
        lighterBlue: _Colors.lighterBlue,
        blueBg: _Colors.blueBg,
        primaryColor: _Colors.primaryColor,
        primaryColorDark: _Colors.primaryColorDark,
      ),
    ],
  );
  return themeData;
}
