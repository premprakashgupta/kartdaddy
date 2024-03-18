import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/data/demo_data.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/models/cart_model.dart';
import 'package:kartdaddy/utility/custom_snackbar.dart';

class CartController extends GetxController {
  var box = GetStorage();
  String _token = '';
  RxList<CartModel> cart = RxList<CartModel>();
  final total = 0.obs;
  final loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _token = box.read('token');
    fetchCartData();
    super.onInit();
  }

  void fetchCartData() async {
    // api
    try {
      String url = ProductApi.getCartList;
      var response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $_token'});
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(jsonData);

        if (jsonData.containsKey('cart_items')) {
          cart.assignAll((jsonData['cart_items'] as List<dynamic>)
              .map((item) => CartModel.fromMap(item))
              .toList());
        }
        if (jsonData.containsKey('total_cart_price')) {
          total.value = jsonData['total_cart_price'] as int;
        }
      }
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }

  void addToCart({required CartModel cartitem}) async {
    try {
      print(cartitem);
      String url = ProductApi.addToCart;
      print(url);
      var response = await http.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer $_token'
      }, body: {
        'product_id': cartitem.product_id.toString(),
        'quantity': cartitem.quantity
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(jsonData);
        cart.add(cartitem);
        if (jsonData.containsKey('total_cart_price')) {
          total.value = jsonData['total_cart_price'];
        }
        CustomSnackbar.showSnackbar(
            title: "Cart", message: jsonData['message']);
      }
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }

  void removeFromcart({required String productId}) async {
    try {
      loading.value = true;
      String url = ProductApi.removeFromCart;
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'product_id': productId});
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(cart.length);
        cart.removeWhere((item) => item.product_id == productId);
        print(cart.length);
        if (jsonData.containsKey('total_cart_price')) {
          total.value = jsonData['total_cart_price'];
        }
        CustomSnackbar.showSnackbar(
            title: "Cart", message: jsonData['message']);
      }
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }

  void quantityPlus() {}
  void quantityMinus() {}
  void removeFromCart() {
    // other thing
    // total -= product['quantity'] * product['price'];
  }

  void manageQuantity(
      {required String product_id, required int quantity}) async {
    try {
      String url = ProductApi.addToCart;
      var response = await http.post(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $_token'},
        body: {
          'product_id': product_id.toString(),
          'quantity': quantity.toString()
        }, // Pass quantity as string
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var index =
            cart.indexWhere((element) => element.product_id == product_id);
        if (index != -1) {
          // Increment quantity in the CartModel instance
          cart[index] = cart[index].copyWith(
              quantity:
                  (int.parse(cart[index].quantity) + quantity).toString());
          if (jsonData.containsKey('total_cart_price')) {
            total.value = jsonData['total_cart_price'];
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }


}
