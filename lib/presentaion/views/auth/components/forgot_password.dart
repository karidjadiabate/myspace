//lib/presentation/auth/components/forgot_password.dart
// lib/views/auth/components/flogin_form.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';
import 'package:myworkspace/presentaion/controllers/auth_controller.dart';


class ForgotPasswordForm extends GetView<AuthController> {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final loc = AppLocalizations.of(context)!;

    return Container(
      height: screenSize.height * 0.27,
      width: screenSize.width * 0.97,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            loc.forgotPassword,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Obx(() => SizedBox(
            width: screenSize.width * 0.90,
            height: 44.0,
            child: TextField(
              onChanged: (value) => controller.email.value = value,
              enabled: !controller.isLoading.value,
              decoration: InputDecoration(
                hintText: loc.email,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 51, 51, 51),
                  size: 20.0,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 10.0
                ),
              ),
              style: const TextStyle(fontSize: 14.0),
            ),
          )),

          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: controller.isLoading.value ? null : controller.goToLogin,
              child: Text(
                loc.login,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),

          Obx(() => SizedBox(
            width: screenSize.width * 0.90,
            child: ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.requestPasswordReset,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: controller.isLoading.value
                ? const CircularProgressIndicator()
                : Text(
                    loc.resetPassword,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          )),

          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 0.0),
            child: Transform.translate(
              offset: const Offset(0, 3),
              child: Text(
                loc.privacy_policy,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.028,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}