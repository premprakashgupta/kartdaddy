import 'package:kartdaddy/api/base_url.dart';

class ProductApi {
  // http://127.0.0.1:8000/api/find-product-with-name?request_data
  static String search =
      "${BaseUrl.baseUrl}/api/find-product-with-name?request_data=";
  // https://kartdaddy.in/api/shop-detail/1682263064/redmi-10a
  static String productDetail = "${BaseUrl.baseUrl}/api/shop-detail";
  static String getWishList = "${BaseUrl.baseUrl}/api/wishlist";
  static String addWishList = "${BaseUrl.baseUrl}/api/wishlist/add";
  // cart api
  static String getCartList = "${BaseUrl.baseUrl}/api/cart";
  static String addToCart = "${BaseUrl.baseUrl}/api/cart/add";
  static String removeFromCart = "${BaseUrl.baseUrl}/api/cart/remove";
  // address api
  static String getAddress = "${BaseUrl.baseUrl}/api/address";
}
