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
    super.onInit();
    fetchProducts();
  }

 void fetchProducts() async {
  try {
    isLoading(true);
    final response = await http.get(Uri.parse(AppURL.getProduct));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // Cache the entire product list
      cachedProducts.value = data.map((json) => ProductModel.fromJson(json)).toList();
      // Load the initial batch of products
      loadMoreProducts();
    } else {
      Get.snackbar('Error', 'Failed to load products');
    }
  } catch (e) {
    Get.snackbar('Error', 'Something went wrong');
  } finally {
    isLoading(false);
  }
}

final RxList<ProductModel> cachedProducts = <ProductModel>[].obs;
final RxBool isLoadingMore = false.obs;

void loadMoreProducts() {
  if (isLoadingMore.value || cachedProducts.isEmpty) return;

  isLoadingMore(true);

  // Load next 20 products (or fewer if less than 20 remain)
  final startIndex = productList.length;
  final endIndex = (startIndex + 20).clamp(0, cachedProducts.length);

  productList.addAll(cachedProducts.sublist(startIndex, endIndex));

  isLoadingMore(false);
}

}
