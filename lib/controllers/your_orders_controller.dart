import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/product_api.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/models/your_orders_model.dart';

class YourOrdersController extends GetxController {
  var box = GetStorage();
  RxList<YourOrdersModel> orderList = RxList<YourOrdersModel>();
  final loading = true.obs;
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
        orderList.assignAll((jsonData['orders'] as List<dynamic>)
            .map((e) => YourOrdersModel.fromMap(e))
            .toList());
      }
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }
}
