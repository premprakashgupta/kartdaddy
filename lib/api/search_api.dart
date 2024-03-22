import 'package:kartdaddy/api/base_url.dart';

class SearchApi {
  static searchProductWithCategory(
          {required String masterCategorySlug,
          required String productName,
          required String page}) =>
      "${BaseUrl.baseUrl}/api/search?search_category=$masterCategorySlug&product_name=$productName&page=$page";

  static String masterCategory = "${BaseUrl.baseUrl}/api/master-categories";
}
