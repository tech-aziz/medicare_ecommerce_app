import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_user/molder_sign_in_as_user.dart';
import 'package:medicare_ecommerce_app/app/home/view/home_view.dart';
import 'package:medicare_ecommerce_app/utils/urls.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(AppURL.login),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status']) {
          Get.snackbar(
            "Success",
            'User login successfully',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            borderRadius: 8,
            duration: const Duration(seconds: 3),
          );
          Get.offAll(() => const HomeView());
        } else {
          Get.snackbar('Error', data['message'] ?? 'Login failed');
          Get.snackbar(
            "Error",
            data['message'] ?? 'Login failed',
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
          'Something went wrong',
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
        'Check your internet connection $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
