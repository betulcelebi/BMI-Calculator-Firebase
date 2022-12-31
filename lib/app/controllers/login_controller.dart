import 'package:bmi_calculator_firebase/shared/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  AuthService authService = AuthService();
  String email = "";
  String password = "";
}
