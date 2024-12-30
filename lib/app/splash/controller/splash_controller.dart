import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_user/controller_sign_in_as_user.dart';
import 'package:medicare_ecommerce_app/app/home/view/home_view.dart';
import 'package:medicare_ecommerce_app/utils/login_handler.dart';

import '../../get_started/get_started.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashToHome();
  }

  void splashToHome() async {
    try {
      print("SplashToHome started");

      // Simulating a splash delay
      await Future.delayed(const Duration(seconds: 3));
      print("Splash delay completed");

      // Fetching login data
      final data = await LoginHandler().getLoginData();
      print("Login data: $data");

      // Navigating based on login state
      if (data != null) {
        print("Navigating to HomeView");
        Get.offAll(() => const HomeView());
      } else {
        print("Navigating to GetStarted");
        Get.offAll(() => const GetStarted());
      }
    } catch (e) {
      print("Error in splashToHome: $e");
      Get.offAll(() => const GetStarted());
    }
  }
}
