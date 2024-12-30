import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_user/molder_sign_in_as_user.dart';
import 'package:medicare_ecommerce_app/app/home/view/home_view.dart';
import 'package:medicare_ecommerce_app/utils/login_handler.dart';
import 'package:medicare_ecommerce_app/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(AppURL.login),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint(data.toString());
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

          // Extract required fields from response
          final token = data['token'];
          final id = data['data']['id'].toString();
          final name = data['data']['name'];
          final image = data['data']['image_name'];
          final branch = data['data']['branch'].toString();

          // Save to SharedPreferences
          await prefs.setString('token', token);
          await prefs.setString('id', id);
          await prefs.setString('name', name);
          await prefs.setString(
              'image', image ?? ''); // Handle null with empty string
          await prefs.setString('branch', branch);

          print(prefs.getString('token'));

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
