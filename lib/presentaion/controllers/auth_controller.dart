// presentation/auth/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myworkspace/core/routes/app_pages.dart';

class AuthController extends GetxController {
 // Observables
 final username = ''.obs;
 final password = ''.obs; 
 final email = ''.obs;
 final isPasswordVisible = false.obs;
 final isLoading = false.obs;

 // Actions de visibilité du mot de passe
 void togglePasswordVisibility() {
   isPasswordVisible.value = !isPasswordVisible.value;
 }

 // Validation des champs
 bool validateInputs() {
   if (username.isEmpty || password.isEmpty) {
     Get.snackbar('Erreur', 'Veuillez remplir tous les champs.');
     return false;
   }
   return true;
 }

 // Login
 Future<void> login() async {
   if (!validateInputs()) return;

   isLoading.value = true;
   Get.dialog(
     const Center(child: CircularProgressIndicator()),
     barrierDismissible: false,
   );

   try {
     final success = await simulateLogin(username.value, password.value);
     Get.back(); // Ferme le spinner
     if (success) {
       Get.offAllNamed('/home');
     } else {
       Get.snackbar('Erreur', 'Nom d\'utilisateur ou mot de passe incorrect.');
     }
   } catch (e) {
     Get.back(); // Ferme le spinner
     Get.snackbar('Erreur', 'Une erreur est survenue : ${e.toString()}');
   } finally {
     isLoading.value = false;
   }
 }

 // Simulation de login
 Future<bool> simulateLogin(String username, String password) async {
   await Future.delayed(const Duration(seconds: 2));
   return username == 'test' && password == '1234'; // Exemple
 }

  void goToForgotPassword() => Get.toNamed(Routes.forgotPassword);
  
  void goToLogin() => Get.offAllNamed(Routes.login);

 // Reset password
 Future<void> requestPasswordReset() async {
   if (email.value.isEmpty) {
     Get.snackbar('Erreur', 'Veuillez saisir votre email');
     return;
   }

   isLoading.value = true;
   Get.dialog(
     const Center(child: CircularProgressIndicator()),
     barrierDismissible: false,
   );

   try {
     await Future.delayed(const Duration(seconds: 2)); // Simulation
     Get.back(); // Ferme le spinner
     Get.snackbar('Succès', 'Email de réinitialisation envoyé');
     goToLogin();
   } catch (e) {
     Get.back(); // Ferme le spinner
     Get.snackbar('Erreur', 'Échec de l\'envoi : ${e.toString()}');
   } finally {
     isLoading.value = false;
   }
 }
}