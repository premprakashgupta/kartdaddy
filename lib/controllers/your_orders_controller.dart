import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/product_api.dart';
import 'package:http/http.dart' as http;

class YourOrdersController extends GetxController {
  var box = GetStorage();
  final orderList = [].obs;
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
      String url = ProductApi.yourOrders;
      var response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $_token'});
      if (response.statusCode == 200) {
        print(response.body);
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        orderList.assignAll(jsonData['orders']);
      }
    } catch (e) {
      print(e);
    }
  }
}
