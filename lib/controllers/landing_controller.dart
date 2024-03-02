import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/auth.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/models/auth/user_model.dart';
import 'package:kartdaddy/screens/home_screen.dart';

import '../services/token_refresh_service.dart';

class LandingController extends GetxController {
  final LoginController _loginController = Get.put(LoginController());
  final TokenRefreshService _tokenRefreshService = Get.find();
  final box = GetStorage();
  final loggedIn = false.obs;
  String _accessToken = '';
  int _expireIn = 0;
  

  @override
  void onInit() {
    super.onInit();
    _accessToken = box.read('access_token') ?? '';
    _expireIn = box.read('expire_in') ?? 0;

    checkTokenExpiry();
  }

  void checkTokenExpiry() async {
    
    try {
      
        var response = await http.post(
          Uri.parse(AuthApi.me),
          headers: {
          "Authorization": "Bearer $_accessToken",
          },
        );
        print("response data ${response.body}");
        if (response.statusCode == 200) {
          var data = json.decode(response.body) as Map<String, dynamic>;

          _loginController.setUser = Usermodel.fromMap(data);
          _loginController.loading.value = false;
          loggedIn.value = true;
        // calling api service to refresh the token automatic
        _tokenRefreshService.startTokenRefreshTimer(expireIn: _expireIn);
        }
      
    } catch (e) {
      // Handle or log the error
      print("Error during checkTokenExpiry: $e");
    }
  }
}
