import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/auth.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/models/auth/user_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';

class LandingController extends GetxController {
  // here because we cant simply initialize it in landing screen
  final LoginController _loginController = Get.put(LoginController());

  final box = GetStorage();
  final loggedIn = false.obs;
  final loading = true.obs;
  String _token = '';

  @override
  void onInit() {
    super.onInit();
    _token = box.read('token') ?? '';

    checkTokenExpiry();
  }

  void checkTokenExpiry() async {
    try {
      var response = await http.get(
        Uri.parse(AuthApi.me),
        headers: {
          "Authorization": "Bearer $_token",
        },
      );
     
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as Map<String, dynamic>;

        _loginController.setUser = UserModel.fromMap(data['user']);
        _loginController.loading.value = false;
        loggedIn.value = true;
        
      }
    } catch (e) {
      // Handle or log the error
      print("Error during checkTokenExpiry: $e");
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'check token expire method throw error',
          ));
    } finally {
      loading.value = false;
    }
  }
}
