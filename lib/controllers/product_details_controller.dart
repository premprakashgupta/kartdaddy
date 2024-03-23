import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/models/product_details_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';

class ProductDetailsController extends GetxController {
  final loading = true.obs;
  final quantity = 1.obs;
  final total = 0.0.obs;
  Rx<ProductDetailModel?> productDetail = Rx<ProductDetailModel?>(null);
  late String slug;
  late String timestamp;

  @override
  void onInit() {
    // TODO: implement onInit
    
    var parameters = Get.parameters;
    slug = parameters['slug'] ?? '';
    timestamp = parameters['timestamp'] ?? '';

    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
     

      String url = "${ProductApi.productDetail}/$timestamp/$slug";
     
      http.Response response = await http.get(Uri.parse(url));
    
      if (response.statusCode == 200) {
       
        var data = await json.decode(response.body) as Map<String, dynamic>;
        productDetail.value = ProductDetailModel.fromMap(data);
        total.value =
            double.parse(productDetail.value!.product.net_sale_amount!);

       
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'product detail fetchData method throw error',
          ));
    } finally {
      loading.value = false;
    }
  }

  void increamentQuantity() {
    if (quantity.value < 5) {
      quantity.value += 1;
      total.value +=
          double.parse(productDetail.value!.product.net_sale_amount!);
    }
  }

  void decreamentQuantity() {
    if (quantity.value > 1) {
      quantity.value -= 1;
      total.value -=
          double.parse(productDetail.value!.product.net_sale_amount!);
    }
  }
}
