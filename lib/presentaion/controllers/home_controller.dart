// lib/core/controllers/home_controller.dart
// lib/core/controllers/home_controller.dart
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedView = 'Home'.obs;

  void updateSelectedView(String view) {
    selectedView.value = view;
  }
}

