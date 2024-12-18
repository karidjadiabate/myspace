// lib/core/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:myworkspace/presentaion/bindings/calendar_binding.dart';
import 'package:myworkspace/presentaion/bindings/forgot_password_binding.dart';
import 'package:myworkspace/presentaion/bindings/splash_binding.dart';
import 'package:myworkspace/presentaion/views/auth/forgot_password_screen.dart';
import 'package:myworkspace/presentaion/views/home/home_screen.dart';
import 'package:myworkspace/presentaion/views/home/sidebar/menu_items/calendar/calendar_screen.dart';
import 'package:myworkspace/presentaion/views/splash/splash_screen.dart';
import 'package:myworkspace/presentaion/bindings/auth_binding.dart';
import 'package:myworkspace/presentaion/views/auth/login_screen.dart';
import 'package:myworkspace/presentaion/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.splashScreen;

  static final routes = [
    // Route Splash
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    // Route Login
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    // Route Forgot Password
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    // Route Home
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    // core/routes/app_pages.dart
  GetPage(
  name: Routes.calendar,
  page: () => const CalendarScreen(),
  binding: CalendarBinding(),
  transition: Transition.fadeIn,
  transitionDuration: const Duration(milliseconds: 300),
),
 GetPage(
      name: Routes.proSync,
      page: () => const CalendarScreen(), 
      binding: CalendarBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}