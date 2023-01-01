import 'package:bmi_calculator_firebase/shared/auth_service.dart';
import 'package:bmi_calculator_firebase/shared/firebase_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static init() async {
    await Get.putAsync(
      () => FirebaseService().init(),
    );
    await Get.putAsync(
      () => AuthService().init(),
    );
  }
}
