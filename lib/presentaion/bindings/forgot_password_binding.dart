// lib/presentation/bindings/forgot_password_binding.dart
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}