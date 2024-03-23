import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/models/order_review_model.dart';
import 'package:http/http.dart' as http;

class OrderReviewController extends GetxController {
  GetStorage box = GetStorage();
  final Rx<OrderReviewModel?> reviewOrderData = Rx<OrderReviewModel?>(null);
  final loading = true.obs;
  String _token = '';

  @override
  void onInit() {
    // TODO: implement onInit
    _token = box.read('token');
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      String url = ProductApi.orderReview;
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $_token'},
      );

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        reviewOrderData.value = OrderReviewModel.fromMap(jsonData);
      }
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }
}
