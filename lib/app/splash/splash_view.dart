import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/login_handler.dart';
import '../get_started/get_started.dart';
import '../home/view/home_view.dart';
import '../res/style/style.dart'; // Make sure AppString is correctly imported.
import 'controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final controller = Get.put(SplashController());
  void splashToHome() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      print("SplashToHome started");

      // Simulating a splash delay
      await Future.delayed(const Duration(seconds: 3));
      print("Splash delay completed");

      // Fetching login data

      final data = preferences.getString("token");
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

  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
    splashToHome();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              // App Icon and Title
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Icon
                  Image.asset(
                    'assets/icons/splash_icon.jpeg', // Replace with your app icon path
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  // App Title
                  Text(
                    AppString.appName, // Replace with your app name string
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Bottom Section: Version and Developer Info
              Column(
                children: [
                  Text(
                    'Version 1.0.0', // Replace with dynamic version if needed
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    thickness: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.developedBy,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        AppString.companyName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
