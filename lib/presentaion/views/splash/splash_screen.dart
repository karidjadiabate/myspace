// views/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myworkspace/core/constants/splash_constant.dart';
import 'package:myworkspace/presentaion/controllers/splash_controller.dart';
import 'components/animated_text.dart';

class SplashScreen extends GetView<SplashController> {
 const SplashScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: SplashConstants.backgroundColor,
     body: Stack(
       children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Expanded(
               child: Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     // Logo animé
                     Obx(() => AnimatedOpacity(
                           duration: SplashConstants.animationDuration,
                           opacity: controller.logoOpacity.value,
                           child: Image.asset(
                             'assets/images/logo/logorewise.png',
                             width: SplashConstants.logoSize,
                           ),
                         )),
                     const SizedBox(height: 20),
                     // Container des textes animés
                     Obx(() => Visibility(
                           visible: controller.textContainerOpacity.value > 0,
                           child: AnimatedOpacity(
                             duration: SplashConstants.animationDuration,
                             opacity: controller.textContainerOpacity.value,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 AnimatedText(
                                   text: 'SIMPLIFY',
                                   offset: controller.offsetSimplify,
                                   opacity: controller.opacitySimplify,
                                 ),
                                 AnimatedText(
                                   text: ' - ',
                                   offset: controller.offsetDash1,
                                   opacity: controller.opacityDash1,
                                 ),
                                 AnimatedText(
                                   text: 'OPTIMIZE',
                                   offset: controller.offsetOptimize,
                                   opacity: controller.opacityOptimize,
                                 ),
                                 AnimatedText(
                                   text: ' - ',
                                   offset: controller.offsetDash2,
                                   opacity: controller.opacityDash2,
                                 ),
                                 AnimatedText(
                                   text: 'SUCCEED',
                                   offset: controller.offsetSucceed,
                                   opacity: controller.opacitySucceed,
                                 ),
                               ],
                             ),
                           ),
                         )),
                   ],
                 ),
               ),
             ),
             // Footer
             Padding(
               padding: const EdgeInsets.only(bottom: 29.0),
               child: Column(
                 children: [
                   Image.asset(
                     'assets/images/logo/prads.png',
                     width: 67,
                   ),
                   const Text(
                     'A Praedium Tech Software 2023 All rights reserved',
                     style: TextStyle(
                       fontSize: 10,
                       color: SplashConstants.textColor,
                     ),
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
             ),
           ],
         ),
       ],
     ),
   );
 }
}