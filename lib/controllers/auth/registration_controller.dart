import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:kartdaddy/screens/auth/otp_verification_screen.dart';
import 'package:kartdaddy/screens/error_screen.dart';

import '../../api/auth.dart';
import '../../models/auth/user_model.dart';

import '../../utility/custom_snackbar.dart';

class RegisterController extends GetxController {
  final box = GetStorage();
  final LoginController _loginController = Get.find();

  final loading = true.obs;
  final disabled = false.obs;

  Future<void> registerUser(
      {required String name,
      required String email,
      required String mobile,
      required String password,
      required String passwordConfirmation,
      required String referralCode}) async {
    try {
      disabled.value = true;
      var response = await http.post(
        Uri.parse(AuthApi.register),
        body: {
          'name': name,
          'email': email,
          'mobile': mobile,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'referral_code': referralCode
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;

        var token = jsonData['token'];
        print("register controller --- $jsonData");

        _loginController.setUser =
            UserModel.fromMap(jsonData['verificationInfo']);
        print("register controller-2 --- ${_loginController.user}");

        box.write('token', token);
        box.write(
            'unique_secret', jsonData['verificationInfo']['unique_secret']);
        CustomSnackbar.showSnackbar(
            title: 'Info', message: jsonData['message']);

        loading.value = false;

        Get.off(() => OTPVerificationScreen());
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'register user method throw error',
          ));
    } finally {
      disabled.value = false;
    }
  }
}
