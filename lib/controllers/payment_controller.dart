import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/payment_url.dart';
import 'package:kartdaddy/screens/bottom_navigation_screen.dart';
import 'package:kartdaddy/screens/payment/thank_you_screen.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';

class PaymentController extends GetxController {
  CFPaymentGatewayService cfPaymentGatewayService =
      CFPaymentGatewayService(); // Cashfree Payment Instance
  var box = GetStorage();
  String _token = '';

  @override
  void onInit() {
    _token = box.read('token');
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
    super.onInit();
  }

  void verifyPayment(String orderId) {
    // Here you might want to update your UI or perform any necessary actions
    Get.offAll(() => ThankYouScreen());

    print("Payment Verified for Order ID: $orderId");
  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    print(
        "Payment Error for Order ID: $orderId - ${errorResponse.getMessage()}");
  }

  Future<CFSession?> createSession() async {
    try {
      var addressId = box.read('addressId');

      final paymentData = await makePaymentViaOnline(addressId: addressId);
      print(paymentData);

      var session = CFSessionBuilder()
          .setEnvironment(CFEnvironment.SANDBOX)
          .setOrderId(paymentData["order_id"])
          .setPaymentSessionId(paymentData["payment_session_id"])
          .build();
      return session;
    } on CFException catch (e) {
      print("Payment Session Creation Error: ${e.message}");
    }
    return null;
  }

  pay() async {
    try {
      var session = await createSession();
      List<CFPaymentModes> components = <CFPaymentModes>[];
      var paymentComponent =
          CFPaymentComponentBuilder().setComponents(components).build();
      var theme = CFThemeBuilder()
          .setNavigationBarBackgroundColorColor("#FF0000")
          .setPrimaryFont("Menlo")
          .setSecondaryFont("Futura")
          .build();
      var cfDropCheckoutPayment = CFDropCheckoutPaymentBuilder()
          .setSession(session!)
          .setPaymentComponent(paymentComponent)
          .setTheme(theme)
          .build();
      cfPaymentGatewayService.doPayment(cfDropCheckoutPayment);
    } on CFException catch (e) {
      print("Payment Error: ${e.message}");
    }
  }

  Future<Map<String, dynamic>> makePaymentViaOnline(
      {required int addressId}) async {
    try {
      String url = PaymentApi.placeOrder;
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'address_id': addressId.toString(), 'payment_mode': 'online'});
      print(response.body);
      var jsonData = await json.decode(response.body) as Map<String, dynamic>;
      return jsonData['return_data'];
    } catch (e) {
      print("Payment Error: $e");
      throw e; // Rethrow the exception to be handled elsewhere if necessary
    }
  }

  void makePaymentViaCOD() async {
    try {
      String url = PaymentApi.placeOrder;
      var addressId = box.read('addressId');
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'address_id': addressId.toString(), 'payment_mode': 'COD'});
      print(response.body);
      var jsonData = await json.decode(response.body) as Map<String, dynamic>;
      Get.off(() => ThankYouScreen());
    } catch (e) {
      print("Payment Error: $e");
    }
  }
}
