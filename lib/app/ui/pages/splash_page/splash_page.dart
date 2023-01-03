import 'package:bmi_calculator_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../controllers/splash_controller.dart';
import 'package:animate_do/animate_do.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.LOGIN);
          },
          child: JelloIn(
            animate: true,
            child: Image.asset("assets/splash.jpg"),
          ),
        ),
      ),
    );
  }
}
