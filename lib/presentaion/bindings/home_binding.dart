import 'package:get/get.dart';
import 'package:myworkspace/presentaion/controllers/home_controller.dart';



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
