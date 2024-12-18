// core/theme/dimensions/app_radius.dart
import 'package:flutter/widgets.dart';

class AppRadius {
  static double screenWidth = 0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
  }

  // Rayons des bordures
  static double radiusS() => screenWidth * 0.01;
  static double radiusM() => screenWidth * 0.02;
  static double radiusL() => screenWidth * 0.04;
  
  // Valeurs fixes si nécessaire
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
}