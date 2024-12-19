// lib/presentation/binding/splash_binding.dart

import 'package:get/get.dart';
import 'package:myworkspace/presentaion/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}