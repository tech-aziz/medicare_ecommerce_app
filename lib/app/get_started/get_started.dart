import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';
import 'package:medicare_ecommerce_app/app/res/style/style.dart';
import '../auth/login/view/sign_in_as_admin.dart';
import '../auth/login/view/sign_in_as_user/sign_in_as_user.dart';
import '../res/component/custom_button.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        // Wrap the Column with Center
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // Ensures the column takes minimum height
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/icons/splash_icon.jpeg'))),
            ),
            Text(
              AppString.welcomeText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              AppString.welcomeSubText,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * .4,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), // Rounded top-left corner
            topRight: Radius.circular(40), // Rounded top-right corner
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton(
                onTap: () {},
                borderColor: AppColors.primaryColor,
                btnName: 'Get Started',
                context: context,
                color: AppColors.primaryColor,
                textColor: Colors.white,
                border: Border.all(color: AppColors.primaryColor, width: 1.8)),
            const SizedBox(
              height: 12,
            ),
            customButton(
                onTap: () => Get.to(() => const SignInAsUser()),
                borderColor: AppColors.primaryColor,
                btnName: 'Sign in as a user',
                context: context,
                textColor: AppColors.primaryColor,
                border: Border.all(color: AppColors.primaryColor, width: 1.8)),
            const SizedBox(
              height: 12,
            ),
            // customButton(
            //     onTap: () => Get.to(() => const SignInAdmin()),
            //     borderColor: AppColors.primaryColor,
            //     btnName: 'Sign in as a admin',
            //     context: context,
            //     textColor: AppColors.primaryColor,
            //     border: Border.all(color: AppColors.primaryColor, width: 1.8)),
          ],
        ),
      ),
    );
  }
}
