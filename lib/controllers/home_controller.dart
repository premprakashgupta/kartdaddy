import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kartdaddy/models/banner_model.dart';
import 'package:kartdaddy/models/category_section_model.dart';
import 'package:kartdaddy/models/section_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';

import '../api/auth.dart';

class HomeController extends GetxController {
  // page controller access by trending page
  final PageController pageController = PageController();
  final sections = <SectionModel>[].obs;
  final categorySections = <CategorySectionsModel>[].obs;
  final bannerData = [].obs;
  final loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      var response = await http.get(
        Uri.parse(AuthApi.home),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = await json.decode(response.body);
        if (jsonData.containsKey("sections")) {
          sections.assignAll((jsonData['sections'] as List<dynamic>? ?? [])
              .map((item) => SectionModel.fromMap(item))
              .toList());
        }

        if (jsonData.containsKey("bannerData")) {
          bannerData.assignAll((jsonData['bannerData'] as List<dynamic>)
              .map((banner) => BannerModel.fromMap(banner))
              .toList());
        }
        if (jsonData.containsKey("categorySections")) {
          categorySections.assignAll(
              (jsonData['categorySections'] as List<dynamic>)
                  .map((section) => CategorySectionsModel.fromMap(section))
                  .toList());
        }

       

        loading.value = false;
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack Trace: $stackTrace');
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'home controller fetchData method throw error',
          ));
    }
  }
}
