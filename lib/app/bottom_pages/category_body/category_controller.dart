import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:medicare_ecommerce_app/app/bottom_pages/category_body/category_model.dart';
import 'package:medicare_ecommerce_app/utils/urls.dart';
 

class CompanyController extends GetxController {
  var companyList = <CompanyModel>[].obs;  
  final String defaultImage = 'assets/images/acme.png';  

  @override
  void onInit() {
    super.onInit();
    fetchCompanies(); 
  }

  void fetchCompanies() async {
    try {
      final response = await http.get(
        Uri.parse(AppURL.getCompanies),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        companyList.value = data.map((json) => CompanyModel.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch companies');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
}
