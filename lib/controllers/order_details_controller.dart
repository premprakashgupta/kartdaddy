// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:kartdaddy/api/product_api.dart';

class OrderDetailsController extends GetxController {
  final String orderId;
  OrderDetailsController({
    required this.orderId,
  });

  var box = GetStorage();
  final orderDetails = {}.obs;
  var _token = '';

  @override
  void onInit() {
    // TODO: implement onInit
    _token = box.read('token');
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      String url = ProductApi.orderDetail(orderId);
      var response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $_token'});
      if (response.statusCode == 200) {
        print(response.body);
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        orderDetails.value = (jsonData['order']);
      }
    } catch (e) {
      print(e);
    }
  }
}
