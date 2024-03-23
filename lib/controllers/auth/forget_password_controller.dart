import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/auth.dart';
import 'package:kartdaddy/screens/landing_screen.dart';

class ForgetPasswordController extends GetxController {
  GetStorage box = GetStorage();
  void sendOtp({required String identifier}) async {
    try {
      String url = AuthApi.forgetPassword;
      http.Response response =
          await http.post(Uri.parse(url), body: {"identifier": identifier});
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        box.write('unique_secret', jsonData['unique_secret']);
      }
    } catch (e) {
      print(e);
    }
  }

  void resetPassword(
      {required String password, required String password_confirmation}) async {
    var token = box.read('token');
    try {
      String url = AuthApi.resetPassword(token: token);
      http.Response response = await http.post(Uri.parse(url), body: {
        "password": password,
        "password_confirmation": password_confirmation
      });
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        box.remove('token');
        box.remove('unique_secret');
        Get.offAll(() => LandingScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}
