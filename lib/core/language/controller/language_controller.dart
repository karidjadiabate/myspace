// core/language/controller/language_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/language_constants.dart';

class LanguageController extends GetxController {
  final Rx<Locale> currentLocale = 
      const Locale(LanguageConstants.defaultLanguage).obs;

  List<Map<String, dynamic>> get availableLanguages =>
      LanguageConstants.availableLanguages;

  void changeLanguage(String code) {
    currentLocale.value = Locale(code);
    Get.updateLocale(currentLocale.value);
    update();
  }

  bool isCurrentLanguage(String code) {
    return currentLocale.value.languageCode == code;
  }

  static AppLocalizations getTranslations(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}