// color_schemes.dart
import 'package:flutter/material.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';

class AppColorSchemes {
  static const ColorScheme light = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.white,
    background: AppColors.white,
    error: AppColors.red,
    onPrimary: AppColors.white,
    onSecondary: AppColors.black,
    onSurface: AppColors.black,
    onBackground: AppColors.black,
    onError: AppColors.white,
  );

  static const ColorScheme dark = ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.darkGray,
    background: AppColors.darkGray,
    error: AppColors.red,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.white,
    onBackground: AppColors.white,
    onError: AppColors.white,
  );
}