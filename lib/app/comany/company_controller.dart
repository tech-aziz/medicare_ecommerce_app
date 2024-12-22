import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_model.dart';
import 'package:medicare_ecommerce_app/utils/urls.dart';

import '../all_product/view/product_model.dart';
import 'company_model.dart';



class CompanyController extends GetxController {
  var companyList = <CompanyModel>[].obs;
  final String defaultImage = 'assets/images/acme.png';

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  String getCompanyName(String id) {
    String data = "";
    companyList.forEach((e) {
      if (e.id == id) {
        data = e.name;
      }
    });
    return data;
  }

  void fetchCompanies() async {
    try {
      final response = await http.get(
        Uri.parse(AppURL.getCompanies),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        companyList.value =
            data.map((json) => CompanyModel.fromJson(json)).toList();
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
