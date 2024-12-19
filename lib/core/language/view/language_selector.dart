import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myworkspace/core/language/controller/language_controller.dart';
import 'package:myworkspace/core/theme/colors/app_colors.dart';


class LanguageSelector extends GetView<LanguageController> {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Get.width * 0.04,
      top: Get.height * 0.05,
      child: GetBuilder<LanguageController>(
        builder: (_) => Row(
          children: controller.availableLanguages
              .map((lang) => _buildLanguageButton(context, lang))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context, Map<String, dynamic> language) {
    return GetBuilder<LanguageController>(
      builder: (_) {
        final isSelected = controller.isCurrentLanguage(language['code']);
        final isFirst = language['code'] == controller.availableLanguages.first['code'];

        return GestureDetector(
          onTap: () => controller.changeLanguage(language['code']),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.red : Colors.white,
              borderRadius: BorderRadius.horizontal(
                left: isFirst ? const Radius.circular(20) : Radius.zero,
                right: !isFirst ? const Radius.circular(20) : Radius.zero,
              ),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              language['code'].toString().toUpperCase(),
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}