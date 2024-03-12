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
}
