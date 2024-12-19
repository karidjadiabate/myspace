// core/language/binding/language_binding.dart
import 'package:get/get.dart';
import '../controller/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController(), permanent: true);
  }
}