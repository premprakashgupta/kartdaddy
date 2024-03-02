import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../api/auth.dart';
import '../../models/auth/user_model.dart';
import '../../screens/home_screen.dart';
import '../../services/token_refresh_service.dart';
import '../../utility/custom_snackbar.dart';

class LoginController extends GetxController {
  final TokenRefreshService _tokenRefreshService = Get.find();
  final box = GetStorage();
  final _user = Rx<Usermodel?>(null);

  int _loginAt = 0;
  final loading = true.obs;
  final disabled = false.obs;

  Usermodel? get user => _user.value;
  set setUser(Usermodel? value) => _user.value = value;

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      disabled.value = true;
      var response = await http.post(
        Uri.parse(AuthApi.login),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;

        var accessToken = jsonData['access_token'];
        var expiresIn = jsonData['expires_in'];
        _loginAt = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        _user.value = Usermodel.fromMap(jsonData['user']);
        print(_user.value);

        box.write('access_token', accessToken);
        box.write('expires_in', expiresIn);
        box.write('login_at', _loginAt);

        CustomSnackbar.showSnackbar(title: 'Info', message: 'Login Successful');

        loading.value = false;
        _tokenRefreshService.startTokenRefreshTimer(expireIn: expiresIn);
        Get.off(() => HomeScreen());
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      CustomSnackbar.showSnackbar(title: "Error", message: e.toString());
    } finally {
      disabled.value = false;
    }
  }

  void logoutUser() async {
    try {
      var accessToken = box.read('access_token');
      await http.post(
        Uri.parse(AuthApi.logout),
        headers: {
          "Authorization": "Bearer $accessToken", // Fix the header name
        },
      );
    } catch (e) {
      // Handle or log the error
      print("Error during logout: $e");
    }

    // Perform necessary actions
    loading.value = true;
    box.remove('access_token');
    box.remove('expires_in');
    box.remove('login_at');
    _user.value = null;
  }
}
