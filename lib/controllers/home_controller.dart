import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../api/auth.dart';

class HomeController extends GetxController {
  // page controller access by trending page
  final PageController pageController = PageController();
  final sections = [].obs;
  final newProducts = [].obs;
  final popularProducts = [].obs;
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
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        sections.assignAll(jsonData['sections']);
        print(sections);
        loading.value = false;
      }
    } catch (e) {}
  }
}
