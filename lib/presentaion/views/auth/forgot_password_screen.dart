// TODO Implement this library.
// lib/view/auth/forgot_password_screen.dart
import 'package:flutter/material.dart';
import 'package:myworkspace/core/language/view/language_selector.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';
import 'package:myworkspace/presentaion/views/auth/components/footer.dart';
import 'package:myworkspace/presentaion/views/auth/components/forgot_password.dart';
import 'package:myworkspace/presentaion/views/auth/components/logo_widget.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

 
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
                  
                  child: ForgotPasswordForm(),
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


