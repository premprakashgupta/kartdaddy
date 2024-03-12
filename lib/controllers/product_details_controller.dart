import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/models/product_details_model.dart';

class ProductDetailsController extends GetxController {
  final String slug;
  final String timestamp;
  ProductDetailsController({required this.timestamp, required this.slug});

  final loading = true.obs;
  Rx<ProductDetailModel?> productDetail = Rx<ProductDetailModel?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      print("fetchData");

      String url = "${ProductApi.productDetail}/$timestamp/$slug";
      print(url);
      var response = await http.get(Uri.parse(url));
      print(response);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var data = await json.decode(response.body) as Map<String, dynamic>;
        productDetail.value = ProductDetailModel.fromMap(data);

        print(productDetail);
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
    } finally {
      loading.value = false;
    }
  }
}