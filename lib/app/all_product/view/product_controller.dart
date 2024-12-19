import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicare_ecommerce_app/utils/urls.dart';
import 'dart:convert';
import 'product_model.dart';  

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse(AppURL.getProduct));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        productList.value = data.map((json) => ProductModel.fromJson(json)).toList();
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
