// core/theme/dimensions/app_sizes.dart
import 'package:flutter/widgets.dart';

class AppSizes {
  // Dimensions dynamiques
  static double screenHeight = 0;
  static double screenWidth = 0;

  // Méthode d'initialisation
  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  // Paddings
  static double paddingXS() => screenWidth * 0.01;
  static double paddingS() => screenWidth * 0.02;
  static double paddingM() => screenWidth * 0.04;
  static double paddingL() => screenWidth * 0.06;
  static double paddingXL() => screenWidth * 0.08;

  // Marges
  static double marginS() => screenWidth * 0.02;
  static double marginM() => screenWidth * 0.04;
  static double marginL() => screenWidth * 0.06;

  // Tailles d'icônes
  static double iconS() => screenWidth * 0.04;
  static double iconM() => screenWidth * 0.06;
  static double iconL() => screenWidth * 0.08;

  // Tailles d'images
  static double imageSmall() => screenWidth * 0.25;
  static double imageMedium() => screenWidth * 0.5;
  static double imageLarge() => screenWidth * 0.75;
  static double imageFixed() => 150.0;

  // Hauteurs de conteneurs
  static double containerHeightSmall() => screenHeight * 0.1;
  static double containerHeightMedium() => screenHeight * 0.2;
  static double containerHeightLarge() => screenHeight * 0.3;

  // Tailles de police
  static double fontXS() => screenWidth * 0.03;
  static double fontS() => screenWidth * 0.04;
  static double fontM() => screenWidth * 0.05;
  static double fontL() => screenWidth * 0.06;
  static double fontXL() => screenWidth * 0.08;

  // Largeurs responsive
  static double minWidth() => 100.0;
  static double maxWidth() => screenWidth * 0.9;
}