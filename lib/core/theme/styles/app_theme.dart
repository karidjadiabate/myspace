// core/theme/styles/text_styles.dart
import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../fonts/app_fonts.dart';
import '../fonts/font_weights.dart';

class AppTextStyles {
  static TextStyle get primaryText => const TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16,
    fontWeight: FontWeights.regular,
    color: AppColors.black
  );

  static TextStyle get titleText => const TextStyle(
    fontFamily: AppFonts.secondaryFont,
    fontSize: 20,
    fontWeight: FontWeights.bold,
    color: AppColors.primary
  );
}