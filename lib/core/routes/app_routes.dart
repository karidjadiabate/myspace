// core/routes/app_routes.dart
// core/routes/app_routes.dart
part of 'app_pages.dart';

abstract class Routes {
  static const String splashScreen = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String forgotPassword = '/forgot-password';
  // Ajoutez d'autres routes spécifiques à la Home page si nécessaire
  static const String workspace = '/home/workspace';
  static const String messages = '/home/messages';
  static const String email = '/home/email';
  static const String administration = '/home/administration';

  // menu sidebar
  static const String calendar = '/home/calendar';
  static const String proSync = '/prosync';


}