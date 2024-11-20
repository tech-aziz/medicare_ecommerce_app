import 'package:get/get.dart';
import '../../get_started/get_started.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    splashToHome();
    super.onInit();
  }

  void splashToHome(){
    Future.delayed(const Duration(seconds: 2),(){
      Get.offAll(()=> const GetStarted());
    },);
  }
}