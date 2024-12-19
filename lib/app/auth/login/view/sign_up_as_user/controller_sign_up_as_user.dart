import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_user/sign_in_as_user.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_up_as_user/model_sign_up_as_user.dart';
import 'package:medicare_ecommerce_app/utils/urls.dart';

class RegistrationController extends GetxController {
  Future<void> registerUser(RegistrationModel model) async {
    const url = AppURL.register;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: model.toJson(),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['status'] == true) {
         
          Get.snackbar(
            "Success",
            body['message'],
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            borderRadius: 8,
            duration: const Duration(seconds: 3),
          );

          Get.off(() => const SignInAsUser());
        } else {
          
           Get.snackbar(
            "Error",
            body['message'],
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            borderRadius: 8,
            duration: const Duration(seconds: 3),
          );
        }
      } else {
         
        Get.snackbar(
          "Error",
          'Failed to register user.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(10),
          borderRadius: 8,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
       
      Get.snackbar(
        "Error",
        'An unexpected error occurred: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
