import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/style/style.dart';
import 'controller/splash_controller.dart';

class SplashView extends StatelessWidget {
   const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Text(
          AppString.appName,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
