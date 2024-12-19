import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Get.width * 0.04,
      top: Get.height * 0.04,
      child: SvgPicture.asset(
        'assets/images/logo/logocolor.svg',
        height: Get.height * 0.1,
      ),
    );
  }
}
