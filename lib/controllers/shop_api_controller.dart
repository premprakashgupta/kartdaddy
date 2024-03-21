// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
import 'package:kartdaddy/api/general_api.dart';
import 'package:kartdaddy/models/shop_api_model.dart';
import 'package:http/http.dart' as http;

class ShopApiController extends GetxController {
  final String slug;

  ShopApiController({
    required this.slug,
  });

  RxList<ShopApiModel?> shop = RxList<ShopApiModel>([]);
  final loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      String url = GeneralApis.shopApi(subCategorySlug: slug);
      var response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        shop.assignAll((jsonData['responseData'] as List<dynamic>)
            .map((e) => ShopApiModel.fromJson(e))
            .toList());
      }
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
