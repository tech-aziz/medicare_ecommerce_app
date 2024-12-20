import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/registration/view/registration_view.dart';
import 'package:medicare_ecommerce_app/app/home/view/home_view.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';
import '../../../res/component/custom_button.dart';
import '../../../res/component/custom_textfield.dart';

class SignUpAsAdmin extends StatefulWidget {
  const SignUpAsAdmin({super.key});

  @override
  State<SignUpAsAdmin> createState() => _SignUpAsAdminState();
}

class _SignUpAsAdminState extends State<SignUpAsAdmin> {
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
                'Sign up',
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
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 12,
              ),
              const CustomTextField(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(
                height: 12,
              ),
              const CustomTextField(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.phone),
              const SizedBox(
                height: 12,
              ),
              const CustomTextField(
                  labelText: 'Store Address',
                  prefixIcon: Icon(Icons.message),
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 12,
              ),
              const CustomTextField(
                  labelText: 'Store Address',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  keyboardType: TextInputType.streetAddress),
              const SizedBox(
                height: 12,
              ),
              const CustomTextField(
                  labelText: 'Store Name',
                  prefixIcon: Icon(Icons.home_work_outlined),
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 12,
              ),
              const CustomTextField(
                  labelText: 'License Number',
                  prefixIcon: Icon(Icons.edit_calendar_rounded),
                  keyboardType: TextInputType.number),
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
                          btnName: 'Register',
                          context: context,
                          color: AppColors.primaryColor,
                          textColor: Colors.white,
                          border: Border.all(color: AppColors.primaryColor, width: 1.8)),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text('Already have an account?', style: TextStyle(color: Colors.black.withOpacity(0.5)),),
                  InkWell(
                      onTap: () => Get.back(),
                      child: Text('Sign in', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 20),)),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
