import 'dart:async';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/api/search_api.dart';
import 'package:kartdaddy/models/master_category_model.dart';
import 'package:kartdaddy/models/shop_api_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';
import 'package:kartdaddy/screens/search/search_result_screen.dart';

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
  final searchProductLoading = true.obs;
  final loadingMasterCat = true.obs;
  final page = 1.obs;
  final count = 0.obs;

  final RxList<String> filteredProducts = <String>[].obs;
  final masterCategories = <MasterCategoryModel>[];
  Rx<MasterCategoryModel?> selectedDropDown = Rx<MasterCategoryModel?>(null);
  final searchedProduct = <ShopApiModel>[].obs;
  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void onInit() {
    super.onInit();
    debounceSearch();
    fetchMasterCategory();
  }

  @override
  void onClose() {
    _debounceTimer?.cancel();
    searchController.dispose();
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
    filteredProducts.clear();
  }

  void fetchMasterCategory() async {
    try {
      String url = SearchApi.masterCategory;
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;

        // adding all data coming from api
        masterCategories.assignAll((jsonData['data'] as List<dynamic>)
            .map((e) => MasterCategoryModel.fromMap(e))
            .toList());
        // adding default value
        masterCategories[0] = MasterCategoryModel.fromMap(
            {'id': 0, 'name': 'All', 'slug': 'all'});
        // selecting default value
        selectedDropDown.value = masterCategories.first;
      }

      loadingMasterCat.value = false;
    } catch (e) {
      print(e);
    }
  }

  void searchProductWithCategory() async {
    try {
      searchProductLoading.value = true;
      String url = SearchApi.searchProductWithCategory(
          masterCategorySlug: selectedDropDown.value!.slug,
          productName: searchController.text,
          page: page.toString());

      http.Response response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        searchedProduct.assignAll((jsonData['responseData'] as List<dynamic>)
            .map((e) => ShopApiModel.fromJson(e))
            .toList());
        count.value = jsonData['count'];
        
      }
      searchProductLoading.value = false;
      Get.to(() => SearchResultScreen());
    } catch (e) {
      print(e);
    }
  }
}
