import 'package:bmi_calculator_firebase/app/bindings/account_binding.dart';
import 'package:bmi_calculator_firebase/app/bindings/home_binding.dart';
import 'package:bmi_calculator_firebase/app/bindings/login_binding.dart';
import 'package:bmi_calculator_firebase/app/bindings/splash_binding.dart';
import 'package:bmi_calculator_firebase/app/ui/pages/account_page/account_page.dart';
import 'package:bmi_calculator_firebase/app/ui/pages/detail_page/detail_page.dart';
import 'package:bmi_calculator_firebase/app/ui/pages/home_page/home_page.dart';
import 'package:bmi_calculator_firebase/app/ui/pages/login_page/login_page.dart';
import 'package:bmi_calculator_firebase/app/ui/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.DETAIL, page: () => DetailPage(), binding: HomeBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.ACCOUNT,
        page: () => const AccountPage(),
        binding: AccountBinding()),

        GetPage(
        name: Routes.SPLASH,
        page: () =>  const SplashPage(),
        binding: SplashBinding()),
  ];
}
