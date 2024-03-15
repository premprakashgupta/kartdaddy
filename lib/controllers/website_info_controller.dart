import 'dart:convert';

import 'package:get/get.dart';
import 'package:kartdaddy/api/general_api.dart';
import 'package:kartdaddy/models/website_info_model.dart';
import 'package:http/http.dart' as http;

class WebsiteInfoController extends GetxController {
  final loading = true.obs;
  Rx<WebsiteInfoModel?> websiteInfo = Rx<WebsiteInfoModel?>(null);
  final categoryList = [].obs;

  @override
  onInit() {
    fetchWebsiteData();
    fetchCategories();
    super.onInit();
  }

  void fetchWebsiteData() async {
    try {
      String url = GeneralApis.websiteInfo;
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        if (jsonData.containsKey('data')) {
          websiteInfo.value = WebsiteInfoModel.fromJson(jsonData['data']);
        }
      }
      print(response.body);
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }

  void fetchCategories() async {
    try {
      String url = GeneralApis.categories;
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        if (jsonData.containsKey('data')) {
          categoryList.assignAll(jsonData['data']);
        }
      }
      print(response.body);
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
