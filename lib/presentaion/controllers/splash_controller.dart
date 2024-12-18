// lib/presentation/controllers/splash_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myworkspace/core/constants/splash_constant.dart';
import 'package:myworkspace/domain/interfaces/splash_interface.dart';


class SplashController extends GetxController implements SplashInterface {
  var logoOpacity = 0.0.obs;
  var logoOffset = const Offset(0, -1).obs;
  var textContainerOpacity = 0.0.obs;

  var opacitySimplify = 0.0.obs;
  var opacityDash1 = 0.0.obs;
  var opacityOptimize = 0.0.obs;
  var opacityDash2 = 0.0.obs;
  var opacitySucceed = 0.0.obs;

  var offsetSimplify = const Offset(0, 1).obs;
  var offsetDash1 = const Offset(0, 1).obs;
  var offsetOptimize = const Offset(0, 1).obs;
  var offsetDash2 = const Offset(0, 1).obs;
  var offsetSucceed = const Offset(0, 1).obs;

  @override
  void onInit() {
    super.onInit();
    startAnimation();
  }

  @override
  Future<void> startAnimation() async {
    logoOpacity.value = 1.0;
    logoOffset.value = const Offset(0, 0);

    await Future.delayed(const Duration(milliseconds: 700));
    textContainerOpacity.value = 1.0;

    await _animateTexts();
    await Future.delayed(SplashConstants.pauseAfterAnimation);
    await _animateTextsReverse();

    navigateToLogin();
  }

  Future<void> _animateTexts() async {
    for (var animation in [
      (opacitySimplify, offsetSimplify),
      (opacityDash1, offsetDash1),
      (opacityOptimize, offsetOptimize),
      (opacityDash2, offsetDash2),
      (opacitySucceed, offsetSucceed),
    ]) {
      await Future.delayed(SplashConstants.animationDelay);
      animation.$1.value = 1.0;
      animation.$2.value = const Offset(0, 0);
    }
  }

  Future<void> _animateTextsReverse() async {
    for (var animation in [
      (opacitySimplify, offsetSimplify),
      (opacityDash1, offsetDash1),
      (opacityOptimize, offsetOptimize),
      (opacityDash2, offsetDash2),
      (opacitySucceed, offsetSucceed),
    ]) {
      await Future.delayed(SplashConstants.animationDelay);
      animation.$1.value = 0.0;
      animation.$2.value = const Offset(0, 1);
    }
  }

  @override
  void navigateToLogin() {
    Get.offAllNamed('/login');
  }
}