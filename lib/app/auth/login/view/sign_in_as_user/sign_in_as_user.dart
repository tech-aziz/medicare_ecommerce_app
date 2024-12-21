import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_admin.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_user/controller_sign_in_as_user.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_up_as_user/sign_up_as_user.dart';
import 'package:medicare_ecommerce_app/app/res/color.dart';
import '../../../../home/view/home_view.dart';
import '../../../../res/component/custom_button.dart';
import '../../../../res/component/custom_textfield.dart';

class SignInAsUser extends StatefulWidget {
  const SignInAsUser({super.key});

  @override
  State<SignInAsUser> createState() => _SignInAsUserState();
}

class _SignInAsUserState extends State<SignInAsUser> {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/icons/splash_icon.jpeg'))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                  CustomTextField(
                    labelText: 'Email/mobile number',
                    prefixIcon: const Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => CustomTextField(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: IconButton(
                        icon: Icon(loginController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: loginController.togglePasswordVisibility,
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: !loginController.isPasswordVisible.value,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            loginController.isLoading.value
                                ? const CircularProgressIndicator()
                                : customButton(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        loginController.login(
                                          _usernameController.text.trim(),
                                          _passwordController.text.trim(),
                                        );
                                      }
                                    },
                                    borderColor: AppColors.primaryColor,
                                    btnName: 'Sign in',
                                    context: context,
                                    color: AppColors.primaryColor,
                                    textColor: Colors.white,
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1.8),
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Don\'t have a account yet?',
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      InkWell(
                        onTap: () => Get.to(() => const SignUpAsUser()),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
