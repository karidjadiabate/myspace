// lib/presentation/views/splash/components/animated_text.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myworkspace/core/constants/splash_constant.dart';


class AnimatedText extends StatelessWidget {
  final String text;
  final Rx<Offset> offset;
  final RxDouble opacity;

  const AnimatedText({
    super.key,
    required this.text,
    required this.offset,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedSlide(
          offset: offset.value,
          duration: SplashConstants.animationDuration,
          child: AnimatedOpacity(
            opacity: opacity.value,
            duration: SplashConstants.animationDuration,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                fontFamily: 'BBigerOver',
                color: SplashConstants.textColor,
              ),
            ),
          ),
        ));
  }
}