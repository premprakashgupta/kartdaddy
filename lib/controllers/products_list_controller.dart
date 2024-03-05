import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/models/products_list_model.dart';

class ProductsListController extends GetxController {
  final String slug;
  ProductsListController({required this.slug});

  final trendingProducts = RxList<ProductsListModel>();
  final loading = true.obs;

  @override
  onInit() {
    super.onInit();
    print(slug);
    fetchData(slug: slug);
  }

  Future<void> fetchData({required String slug}) async {
    try {
      final uri = Uri.parse('https://kartdaddy.in/api/section/$slug');
      var response = await http.get(uri);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as Map<String, dynamic>;
        print("hii");

        // Check if 'products' key exists in the data
        if (data.containsKey('products')) {
          // Assuming 'products' is a list, not a map
          List<dynamic> productsList = data['products']['data'];

          // Map each product data to the ProductsListModel
          List<ProductsListModel> products = productsList
              .map((productData) => ProductsListModel.fromMap(productData))
              .toList();

          // Update the observable data
          trendingProducts.assignAll(products);
          loading.value = false;
          print(data['products']['data']);
        }
      }
    } catch (e) {
      // Handle or log the error
      print("Error: $e");
    }
  }
}
