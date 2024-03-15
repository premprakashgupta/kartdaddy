import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/general_api.dart';
import 'package:kartdaddy/models/website_info_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';

import '../../api/auth.dart';
import '../../models/auth/user_model.dart';
import '../../screens/home_screen.dart';

import '../../utility/custom_snackbar.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  final _user = Rx<UserModel?>(null);

  
  final loading = true.obs;
  final disabled = false.obs;

  UserModel? get user => _user.value;
  set setUser(UserModel? value) => _user.value = value;

  

  Future<void> loginUser(
      {required String login_id, required String password}) async {
    try {
      disabled.value = true;
      var response = await http.post(
        Uri.parse(AuthApi.login),
        body: {'login_id': login_id, 'password': password},
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;

        var token = jsonData['token'];
        print("login controller --- ${jsonData['user']}");

        _user.value = UserModel.fromMap(jsonData['user']);
        print("login controller --- ${_user.value}");

        box.write('token', token);
        // box.write('user', jsonData['user']);

        CustomSnackbar.showSnackbar(
            title: 'Info', message: jsonData['message']);

        loading.value = false;

        Get.off(() => HomeScreen());
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'Login method throw error',
          ));
    } finally {
      disabled.value = false;
    }
  }

  void logoutUser() async {
    try {
      var token = box.read('token');
      await http.post(
        Uri.parse(AuthApi.logout),
        headers: {
          "Authorization": "Bearer $token", // Fix the header name
        },
      );
    } catch (e) {
      // Handle or log the error
      print("Error during logout: $e");
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'Logout method throw error',
          ));
    }

    // Perform necessary actions
    loading.value = false;
    box.remove('token');
    _user.value = null;
  }
}
