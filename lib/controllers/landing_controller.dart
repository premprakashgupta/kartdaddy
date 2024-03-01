import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/auth.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/models/auth/user_model.dart';
import 'package:kartdaddy/screens/home_screen.dart';

class LandingController extends GetxController {
  final LoginController _loginController = Get.put(LoginController());
  final box = GetStorage();
  final loggedIn = false.obs;
  String _accessToken = '';
  int _expiresIn = 0;
  int _loginAt = 0;

  @override
  void onInit() {
    super.onInit();
    _accessToken = box.read('access_token') ?? '';
    _expiresIn = box.read('expires_in') ?? 0;
    _loginAt = box.read('login_at') ?? 0;

    checkTokenExpiry();
  }

  void checkTokenExpiry() async {
    DateTime loginTime = DateTime.fromMillisecondsSinceEpoch(_loginAt * 1000);
    print("logintime : $loginTime");
    Duration durationSinceLogin = DateTime.now().difference(loginTime);
    print("duration : $durationSinceLogin");
    print(_accessToken);
    print("expireIn : $_expiresIn");
    print(durationSinceLogin.inSeconds);
    try {
      if (_accessToken != '' &&
          _expiresIn != 0 &&
          durationSinceLogin.inSeconds < _expiresIn) {
        // call api using token and set the user value

        var accessToken = box.read('access_token');
        var response = await http.post(
          Uri.parse(AuthApi.me),
          headers: {
            "Authorization": "Bearer $accessToken", // Fix the header name
          },
        );
        print("response data ${response.body}");
        if (response.statusCode == 200) {
          var data = json.decode(response.body) as Map<String, dynamic>;

          _loginController.setUser = Usermodel.fromMap(data);
          _loginController.loading.value = false;
          loggedIn.value = true;
        }
      }
    } catch (e) {
      // Handle or log the error
      print("Error during checkTokenExpiry: $e");
    }
  }
}
