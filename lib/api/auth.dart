import 'package:kartdaddy/api/base_url.dart';

class AuthApi {
  static String home = "${BaseUrl.baseUrl}/api/home";
  static String login = "${BaseUrl.baseUrl}/api/login";
  static String me = "${BaseUrl.baseUrl}/api/me";
  static String refresh = "${BaseUrl.baseUrl}/api/refresh";

  // register
  static String register = "${BaseUrl.baseUrl}/api/register";
  static String verifyOtp = "${BaseUrl.baseUrl}/api/verify-otp";
  static String logout = "${BaseUrl.baseUrl}/api/logout";

  // forget passwor api

  static String forgetPassword = "${BaseUrl.baseUrl}/api/forgot-password";
  static String veryfyOtpForgetPassword =
      "${BaseUrl.baseUrl}/api/verify-otp-forgot-password";

  static String resetPassword({required String token}) =>
      "${BaseUrl.baseUrl}/api/change-password/$token";

  static String editEmail = "${BaseUrl.baseUrl}/api/user/email/edit";
  static String updateEmail = "${BaseUrl.baseUrl}/api/user/email/update";
  static String editMobile = "${BaseUrl.baseUrl}/api/user/mobile/edit";
  static String updateMobile = "${BaseUrl.baseUrl}/api/user/mobile/update";
 
  static String updateName = "${BaseUrl.baseUrl}/api/user/update-name";
  static String updatePassword = "${BaseUrl.baseUrl}/api/user/update-password";
}
