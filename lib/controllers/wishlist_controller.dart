import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/controllers/cartController.dart';
import 'package:kartdaddy/models/cart_model.dart';
import 'package:kartdaddy/models/product_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';
import 'package:kartdaddy/utility/custom_snackbar.dart';

class WishListController extends GetxController {
  final CartController _cartController = Get.find();
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
        
        // updating wishlist is remaining
        if (wishlists.any((element) => element.id == product.id)) {
          wishlists.removeWhere((element) => element.id == product.id);
        } else {
          wishlists.add(product);
        }
        CustomSnackbar.showSnackbar(
            title: "Wishlist", message: jsonData['message']);
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
        
        // updating wishlist is remaining
        if (wishlists.any((element) => element.id == product.id)) {
          wishlists.remove(product);
        }
        CustomSnackbar.showSnackbar(
            title: "Wishlist", message: jsonData['message']);
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

  void moveToCart({required int product_id}) async {
    try {
      
      String url = ProductApi.moveToCart;
      var response = await http.post(Uri.parse(url), headers: {
        "Authorization": "Bearer $token",
      }, body: {
        'product_id': product_id.toString(),
        "quantity": "1"
      });
      
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        

        wishlists.removeWhere((element) => element.id == product_id);
        _cartController.cart.assignAll((jsonData['cart_items'] as List<dynamic>)
            .map((item) => CartModel.fromMap(item))
            .toList());
        CustomSnackbar.showSnackbar(
            title: "Wishlist", message: jsonData['message']);
        loading.value = false;
        update();
      }
    } catch (e) {
      print(e);
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'move to cart method throw error',
          ));
    }
  }
}
