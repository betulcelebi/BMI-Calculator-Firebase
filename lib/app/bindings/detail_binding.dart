import 'package:bmi_calculator_firebase/app/controllers/home_controller.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
