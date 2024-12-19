// lib/views/auth/components/flogin_form.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';
import 'package:myworkspace/presentaion/controllers/auth_controller.dart';


class LoginForm extends GetView<AuthController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final loc = AppLocalizations.of(context)!;

    return Container(
      height: screenSize.height * 0.35,
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
            loc.login,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          // Username field
          SizedBox(
            width: screenSize.width * 0.90,
            height: 44.0,
            child: TextField(
              onChanged: (value) => controller.username.value = value,
              decoration: InputDecoration(
                hintText: loc.username,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 51, 51, 51),
                  size: 20.0,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              ),
              style: const TextStyle(fontSize: 14.0),
            ),
          ),

          const SizedBox(height: 12),

          // Password field
          Obx(() => SizedBox(
            width: screenSize.width * 0.90,
            height: 44.0,
            child: TextField(
              onChanged: (value) => controller.password.value = value,
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                hintText: loc.password,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 51, 51, 51),
                  size: 20.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: const Color.fromARGB(255, 51, 51, 51),
                    size: 20.0,
                  ),
                  onPressed: () => controller.togglePasswordVisibility(),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                isDense: true,
              ),
              style: const TextStyle(fontSize: 14.0),
            ),
          )),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: controller.goToForgotPassword,
              child: Text(
                loc.fpassword,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),

          // Login button
          SizedBox(
            width: screenSize.width * 0.90,
            child: ElevatedButton(
              onPressed: controller.login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Text(
                loc.connect,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

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