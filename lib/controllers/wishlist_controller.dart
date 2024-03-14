import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/models/product_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';

class WishListController extends GetxController {
  var box = GetStorage();
  final loading = true.obs;
  final wishlists = <ProductModel>[].obs;
  String token = '';
  @override
  void onInit() {
    // TODO: implement onInit
    token = box.read('token');
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      String url = ProductApi.getWishList;
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(response.body);
        wishlists.assignAll((jsonData['products'] as List<dynamic>)
            .map((product) => ProductModel.fromMap(product)));
        loading.value = false;
      }
    } catch (e) {
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'wishlist controller fetchData method throw error',
          ));
    }
  }

  void addWishList({required ProductModel product}) async {
    try {
      String url = ProductApi.addWishList;
      var response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
      }, body: {
        'productId': product.id.toString()
      });
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(response.body);
        // updating wishlist is remaining
        if (wishlists.any((element) => element.id == product.id)) {
         
          wishlists.removeWhere((element) => element.id == product.id);
        } else {
          wishlists.add(product);
        }
        update();
      }
    } catch (e) {
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'addwishlist method throw error',
          ));
    }
  }

  void removeWishList({required ProductModel product}) async {
    try {
      String url = ProductApi.addWishList;
      var response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
      }, body: {
        'productId': product.id.toString()
      });
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(response.body);
        // updating wishlist is remaining
        if (wishlists.any((element) => element.id == product.id)) {
          wishlists.remove(product);
        }
        loading.value = false;
        update();
      }
    } catch (e) {
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'remove wishlist method throw error',
          ));
    }
  }
}
