import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'text_theme.dart';

class AppTheme {
  /// Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    textTheme: AppTextTheme.lightTextTheme, // Uses Light Text Theme
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      titleTextStyle: AppTextTheme.lightTextTheme.headlineMedium,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        textStyle: AppTextTheme.lightTextTheme.labelLarge,
      ),
    ),
  );

  ///Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    textTheme: AppTextTheme.darkTextTheme, //Uses Dark Text Theme
    scaffoldBackgroundColor:darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackground,
      titleTextStyle: AppTextTheme.darkTextTheme.headlineMedium,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.primary,
        textStyle: AppTextTheme.darkTextTheme.labelLarge,
      ),
    ),
  );
}
