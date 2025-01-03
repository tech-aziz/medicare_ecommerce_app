import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_model.dart';
import 'package:medicare_ecommerce_app/utils/urls.dart';

import '../../all_product/view/product_model.dart';


class CategoryController extends GetxController {
  var categoryList = <CategoryModel>[].obs;
  final String defaultImage = 'assets/images/acme.png';

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  String getCompanyName(String id) {
    String data = "";
    categoryList.forEach((e) {
      if (e.productCategorySlNo == id) {
        data = e.productCategoryName.toString();
      }
    });
    return data;
  }

  void fetchCategories() async {
    try {
      final response = await http.get(
        Uri.parse(AppURL.getCategories),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        categoryList.value =
            data.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch companies');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  var isLoading = true.obs;
  void fetchProducts(String companyId) async {
    try {
      isLoading(
          true); // Assuming `isLoading` is an observable or state variable

      // Make the POST request
      final response = await http.post(
        Uri.parse(AppURL.getProduct),
        body: {
          "categoryId": companyId,
        },
      );

      // Handle response
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        // Cache the entire product list
        cachedProducts.value =
            data.map((json) => ProductModel.fromJson(json)).toList();
        isLoading(false);
        // Optionally, update the view if necessary
        // Get.snackbar('Success', 'Products loaded successfully');
      } else {
        // Error handling for unsuccessful HTTP responses
        // Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      // Exception handling
      // Get.snackbar('Error', 'Something went wrong');
      print('Error fetching products: $e');
    } finally {
      // Reset loading state
    }
  }

  final RxList<ProductModel> cachedProducts = <ProductModel>[].obs;
}
