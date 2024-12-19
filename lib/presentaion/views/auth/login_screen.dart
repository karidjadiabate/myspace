// lib/view/auth/login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myworkspace/core/language/view/language_selector.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';
import 'package:myworkspace/presentaion/controllers/auth_controller.dart';
import 'package:myworkspace/presentaion/views/auth/components/footer.dart';
import 'package:myworkspace/presentaion/views/auth/components/logo_widget.dart';
import 'components/login_form.dart';


class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          // Partie supérieure avec l'image
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  // Image de fond
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/logo/img2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const LogoWidget(),
                  const LanguageSelector(),
                ],
              ),
            ),
          ),
          Container(
            height: screenSize.height * 0.5,
            decoration: BoxDecoration(
              color: AppColors.gray.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                // Formulaire de connexion
                Positioned(
                  top: 8,
                  child: LoginForm(),
                ),
                Positioned(
                  bottom: 5,
                  child: FooterTexts(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
