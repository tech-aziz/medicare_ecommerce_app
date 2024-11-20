import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_admin.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_up_as_user.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';
import '../../../home/view/home_view.dart';
import '../../../res/component/custom_button.dart';
import '../../../res/component/custom_textfield.dart';

class SignInAsUser extends StatefulWidget {
  const SignInAsUser({super.key});

  @override
  State<SignInAsUser> createState() => _SignInAsUserState();
}

class _SignInAsUserState extends State<SignInAsUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign in as a user',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                'please fill the credentials',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomTextField(
                  labelText: 'Email/mobile number',
                  prefixIcon: Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(
                height: 12,
              ),

              const CustomTextField(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  keyboardType: TextInputType.number),

              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customButton(
                          onTap: () => Get.offAll(() => const HomeView()),
                          borderColor: AppColors.primaryColor,
                          btnName: 'Sign in',
                          context: context,
                          color: AppColors.primaryColor,
                          textColor: Colors.white,
                          border: Border.all(color: AppColors.primaryColor, width: 1.8)),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text('Don\'t have a account yet?', style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                  InkWell(
                      onTap: () => Get.to(() => const SignUpAsUser()),
                      child: Text('Sign up', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 20),)),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
