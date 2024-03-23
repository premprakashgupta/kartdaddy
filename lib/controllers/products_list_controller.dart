import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/models/product_model.dart';
import 'package:kartdaddy/screens/error_screen.dart';

class ProductsListController extends GetxController {
  final String slug;
  ProductsListController({required this.slug});

  final products = RxList<ProductModel>();
  final loading = true.obs;

  @override
  onInit() {
    super.onInit();
   
    fetchData(slug: slug);
  }

  Future<void> fetchData({required String slug}) async {
    try {
      final uri = Uri.parse('https://kartdaddy.in/api/section/$slug');
      http.Response response = await http.get(uri);
    

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as Map<String, dynamic>;
       

        // Check if 'products' key exists in the data
        if (data.containsKey('products')) {
          // Assuming 'products' is a list, not a map
          List<dynamic> productsList = data['products']['data'];

          // Map each product data to the ProductModel
          List<ProductModel> localProducts = productsList
              .map((productData) => ProductModel.fromMap(productData))
              .toList();

          // Update the observable data
          products.assignAll(localProducts);
          loading.value = false;
         
        }
      }
    } catch (e) {
      // Handle or log the error
      print("Error: $e");
      Get.to(() => ErrorScreen(
            error: e.toString(),
            place: 'product list fetchData method throw error',
          ));
    } 
  }
}
