import 'package:explorer_flutter_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteFF,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteFF,
      foregroundColor: AppColors.black00, // text color in AppBar
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black00,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black00,
      foregroundColor: AppColors.whiteFF, // text color in AppBar
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black00,
      brightness: Brightness.dark, // 👈 must match brightness
    ),
    useMaterial3: true,
  );
}
