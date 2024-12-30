import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicare_ecommerce_app/app/order/order_model.dart';
import 'package:medicare_ecommerce_app/utils/urls.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryController extends GetxController {
  var orderHistyList = <OrderHistoryModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrderHistory();
  }

  void fetchOrderHistory() async {
    print("api call");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      isLoading(true);
      final response = await http.get(headers: {
        "Authorization": "Bearer ${preferences.getString("token")}"
      }, Uri.parse(AppURL.getOrderHistory));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        // Cache the entire product list
        orderHistyList.value =
            data.map((json) => OrderHistoryModel.fromJson(json)).toList();
        // Load the initial batch of products
        update();
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading(false);
    }
  }
}
