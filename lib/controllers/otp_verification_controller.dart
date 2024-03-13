import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/auth.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:kartdaddy/controllers/landing_controller.dart';
import 'package:kartdaddy/models/auth/user_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';
import 'package:kartdaddy/screens/home_screen.dart';
import 'package:kartdaddy/utility/custom_snackbar.dart';

class OtpVerificationController extends GetxController {
  final LoginController _loginController = Get.find();
  final LandingController _landingController = Get.find();
  final box = GetStorage();
  final newOtp = ''.obs;
  void onOtpSubmit() async {
    String uniqueSecret = box.read('unique_secret');
    print(uniqueSecret);
    if (uniqueSecret == '') {
      CustomSnackbar.showSnackbar(
          title: "Error", message: 'Register Again, unique code is missing');
      return null;
    }
    if (newOtp.value != '') {
      try {
        print("21 otp controller ${newOtp.value}");
        String url = AuthApi.verifyOtp;
        print("url --- $url");
        var response = await http.post(Uri.parse(url),
            body: {'otp': newOtp.value, 'unique_secret': uniqueSecret});
        print("response body string ${response.body}");
        if (response.statusCode == 201) {
          var data = await json.decode(response.body) as Map<String, dynamic>;
          print("jasonData $data");
          _loginController.setUser = UserModel.fromMap(data['user']);
          _loginController.loading.value = false;
          _landingController.loggedIn.value = true;
          // it will remove in future
          box.write('token', "brhjfbhjrebre");
          Get.off(() => HomeScreen());
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
}
