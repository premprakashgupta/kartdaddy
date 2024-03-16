import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/general_api.dart';
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/screens/error_screen.dart';

class ProductRepository {
  Future<List<String>> searchProducts(String query) async {
    final response = await http.get(Uri.parse(ProductApi.search + query));
    if (response.statusCode == 200) {
      return json.decode(response.body).cast<String>();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

class SearchScreenController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();

  final RxString query = ''.obs;
  final loading = false.obs;
  final RxList<String> filteredProducts = <String>[].obs;
  List<String> categories = ['All', 'B', 'C', 'D'];
  final selectedDropDown = "All".obs;
  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void onInit() {
    super.onInit();
    debounceSearch();
  }

  @override
  void onClose() {
    _debounceTimer?.cancel();
    super.onClose();
  }

  void debounceSearch() {
    ever(query, (String value) {
      if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 500), () {
        filterProducts(value);
      });
    });
  }

  void filterProducts(String query) async {
    if (query == "") {
      filteredProducts.clear();
      loading.value = false;
    } else {
      try {
        loading.value = true;
        var data = await _productRepository.searchProducts(query);
        filteredProducts.assignAll(data);
        loading.value = false;
        update();
      } catch (e) {
        print('Error: $e');
        loading.value = false;
        Get.to(() => ErrorScreen(
              error: e.toString(),
              place: 'search screen filter method throw error',
            ));
      }
    }
  }

  void onSelect({required String item}) {
    searchController.text = item;
  }

  void searchProductWithCategory() async {
    try {
      String url = GeneralApis.searchProductWithCategory;
      var response = await http.get(Uri.parse(url));
    } catch (e) {}
  }
}
