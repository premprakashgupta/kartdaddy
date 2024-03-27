import 'package:kartdaddy/api/base_url.dart';

class PaymentApi {
  static String placeOrder = "${BaseUrl.baseUrl}/api/order/place";
  static String verifyPayment = "${BaseUrl.baseUrl}/api/order/verify-payment";
}
