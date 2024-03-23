import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/auth.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:kartdaddy/controllers/landing_controller.dart';
import 'package:kartdaddy/models/auth/user_model.dart';
import 'package:kartdaddy/screens/auth/reset_password_screen.dart';
import 'package:kartdaddy/screens/bottom_navigation_screen.dart';
import 'package:kartdaddy/screens/error_screen.dart';
import 'package:kartdaddy/utility/custom_snackbar.dart';

class OtpVerificationController extends GetxController {
  final LoginController _loginController = Get.find();
  final LandingController _landingController = Get.find();
  final box = GetStorage();
  final newOtp = ''.obs;

  void onOtpSubmit() async {
    String uniqueSecret = box.read('unique_secret');

    if (uniqueSecret == '') {
      CustomSnackbar.showSnackbar(
          title: "Error", message: 'Register Again, unique code is missing');
      return null;
    }
    if (newOtp.value != '') {
      try {
        String url = AuthApi.verifyOtp;

        http.Response response = await http.post(Uri.parse(url),
            body: {'otp': newOtp.value, 'unique_secret': uniqueSecret});

        if (response.statusCode == 201) {
          var data = await json.decode(response.body) as Map<String, dynamic>;

          _loginController.setUser = UserModel.fromMap(data['user']);
          _loginController.loading.value = false;
          _landingController.loggedIn.value = true;
          // it will remove in future when token come from backend
          box.write('token', "brhjfbhjrebre");
          box.remove('unique_secret');
          Get.off(() => const BottomNavigationScreen());
        }
      } catch (e, stackTrace) {
        print(stackTrace.toString());
        print(e.toString());
        Get.to(() => ErrorScreen(
              error: e.toString(),
              place: 'onOtpSubmit method throw error',
            ));
      }
    } else {
      CustomSnackbar.showSnackbar(title: "Error", message: 'otp is empty');
    }
  }

  void verifyOtpForForgetPassword() async {
    var uniqueSecret = box.read('unique_secret');
    try {
      String url = AuthApi.veryfyOtpForgetPassword;
      http.Response response = await http.post(Uri.parse(url),
          body: {"otp": newOtp.value, "unique_secret": uniqueSecret});
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        box.write('token', jsonData['data']['token']);
        Get.to(() => ResetPasswordScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}
