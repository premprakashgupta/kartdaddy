import 'package:kartdaddy/api/base_url.dart';

class AuthApi {
  static String home = "${BaseUrl.baseUrl}/api/home";
  static String login = "${BaseUrl.baseUrl}/api/login";
  static String me = "${BaseUrl.baseUrl}/api/me";
  static String refresh = "${BaseUrl.baseUrl}/api/refresh";
  static String logout = "${BaseUrl.baseUrl}/api/logout";
}
