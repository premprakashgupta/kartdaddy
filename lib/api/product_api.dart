import 'package:kartdaddy/api/base_url.dart';

class ProductApi {
  static String search =
      "${BaseUrl.baseUrl}/api/find-product-with-name?request_data=";
  static String productDetail = "${BaseUrl.baseUrl}/api/shop-detail";
  static String getWishList = "${BaseUrl.baseUrl}/api/wishlist";
  static String addWishList = "${BaseUrl.baseUrl}/api/wishlist/add";
  static String getCartList = "${BaseUrl.baseUrl}/api/cart";
  static String addToCart = "${BaseUrl.baseUrl}/api/cart/add";
  static String removeFromCart = "${BaseUrl.baseUrl}/api/cart/remove";
  static String getAddress = "${BaseUrl.baseUrl}/api/address";
  static String addAddress = "${BaseUrl.baseUrl}/api/address/add";
  static String updateAddress(int addressId) =>
      "${BaseUrl.baseUrl}/api/address/update/$addressId";
  static String removeAddress(int addressId) =>
      "${BaseUrl.baseUrl}/api/address/remove/$addressId";
  static String shop(String subCategorySlug) =>
      "${BaseUrl.baseUrl}/api/shop?category=$subCategorySlug";
}
