import 'package:kartdaddy/api/base_url.dart';

class ProductApi {
  // http://127.0.0.1:8000/api/find-product-with-name?request_data
  static String search =
      "${BaseUrl.baseUrl}/api/find-product-with-name?request_data=";
  // https://kartdaddy.in/api/shop-detail/1682263064/redmi-10a
  static String productDetail = "${BaseUrl.baseUrl}/api/shop-detail";
}