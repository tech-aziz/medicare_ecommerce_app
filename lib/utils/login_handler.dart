import 'package:get/get.dart';
import 'package:medicare_ecommerce_app/app/auth/login/view/sign_in_as_user/sign_in_as_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginHandler {
  Future<void> saveLoginData(Map<String, dynamic> response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Extract required fields from response
    final token = response['token'];
    final id = response['data']['id'].toString();
    final name = response['data']['name'];
    final image = response['data']['image_name'];
    final phone = response['data']['phone'];
    final branch = response['data']['branch'].toString();

    // Save to SharedPreferences
    await prefs.setString('token', token);
    await prefs.setString('id', id);
    await prefs.setString('name', name);
    await prefs.setString('image', image ?? ''); // Handle null with empty string
    await prefs.setString('branch', branch);
    await prefs.setString('phone', phone);
  }

  Future<Map<String, String>> getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return {
      'token': prefs.getString('token') ?? '',
      'id': prefs.getString('id') ?? '',
      'name': prefs.getString('name') ?? '',
      'image': prefs.getString('image') ?? '',
      'branch': prefs.getString('branch') ?? '',
      'phone': prefs.getString('phone')?? "",
    };
  }

  Future<void> clearData() async {
   
  }


}
