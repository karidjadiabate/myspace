// presentation/interfaces/auth_interface.dart
abstract class IAuthController {
  Future<void> login();
  void goToForgotPassword();
  void logout();
  void togglePasswordVisibility();
}