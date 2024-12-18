// lin/core/constants/splash_constant.dart
import 'package:flutter/material.dart';

class SplashConstants {
  // Délais d'animation
  static const Duration animationDelay = Duration(milliseconds: 400);
  static const Duration logoDelay = Duration(milliseconds: 100);
  static const Duration textDelay = Duration(milliseconds: 400);
  static const Duration pauseAfterAnimation = Duration(milliseconds: 0);

  // Styles
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Color.fromARGB(255, 101, 100, 100);
  static const double logoSize = 150.0;

  // Animation
  static const Curve animationCurve = Curves.easeInOut;
  static const Duration animationDuration = Duration(milliseconds: 400);
}