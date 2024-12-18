import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myworkspace/core/language/bindings/language_binding.dart';
import 'core/routes/app_pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mon Application',
      debugShowCheckedModeBanner: false,
      
      // Configuration des localisations
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr'), // Français
        Locale('en'), // Anglais
      ],
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('fr'),
      
      // Configuration des routes
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      
      // Binding initial pour la gestion des langues
      initialBinding: LanguageBinding(),
    );
  }
}