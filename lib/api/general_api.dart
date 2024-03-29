import 'package:kartdaddy/api/base_url.dart';

class GeneralApis {
  static String websiteInfo = "${BaseUrl.baseUrl}/api/info";
  static String categories = "${BaseUrl.baseUrl}/api/categories";
  
  static shopApi({required String subCategorySlug}) =>
      "${BaseUrl.baseUrl}/api/shop?category=$subCategorySlug";
}
