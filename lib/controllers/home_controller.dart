import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
   final PageController pageController = PageController();
  final _searchBox = false.obs;
  final _currentPage = 0.obs;

  bool get searchBox => _searchBox.value;
  get currentPage => _currentPage.value;
  void toggleSearchBox() {
    _searchBox.value = !_searchBox.value;
  }
  

  // @override
  // void onInit() {
  //   super.onInit();
  //   pageController.addListener(() {
  //     currentPage.value = pageController.page!.round();
  //   });
  // }
}
