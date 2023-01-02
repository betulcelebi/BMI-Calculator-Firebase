
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    print('hello');
    super.onInit();
  }
  @override
  void onReady() async{
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(Routes.LOGIN);
    super.onReady();
  }

}
  