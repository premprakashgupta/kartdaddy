import 'package:get/get.dart';
import 'package:kartdaddy/data/demo_data.dart';

class CartController extends GetxController {
  List<Map<String, dynamic>> cartList = DemoData.demoProductData;
  final cart = [].obs;
  final total = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchCartData();
    super.onInit();
  }

  void fetchCartData() {
    // api
    cart.addAll(cartList);
    calculateTotal();
  }

  void quantityPlus() {}
  void quantityMinus() {}
  void removeFromCart() {
    // other thing
    // total -= product['quantity'] * product['price'];
  }

  void calculateTotal() {
    total.value = 0;
    for (var product in cart) {
      total.value += product['quantity'] * product['price'] as double;
    }
  }
}
