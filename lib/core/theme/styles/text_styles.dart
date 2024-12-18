// core/theme/styles/app_theme.dart
import 'package:flutter/material.dart';
import 'package:myworkspace/core/theme/styles/app_theme.dart';
import '../colors/app_colors.dart';
import 'button_styles.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppButtonStyle.primaryButton,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.primaryText,
      titleLarge: AppTextStyles.titleText,
    ),
  );
}