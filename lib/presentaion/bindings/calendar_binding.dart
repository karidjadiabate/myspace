// lib/presentation/bindings/calendar_binding.dart

import 'package:get/get.dart';
import 'package:myworkspace/presentaion/controllers/calendar_controller.dart';


class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    print("CalendarBinding appelé"); // Debug pour vérifier si le binding est bien exécuté
    Get.lazyPut<CustomCalendarController>(() => CustomCalendarController());
  }
}

