import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/models/address_model.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  var box = GetStorage();
  final addressList = <AddressModel>[].obs;
  String _token = '';

  @override
  void onInit() {
    // TODO: implement onInit
    _token = box.read('token');
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      String url = ProductApi.getAddress;
      var response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $_token'});
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(jsonData['addresses']);
        addressList.assignAll((jsonData['addresses'] as List<dynamic>)
            .map((item) => AddressModel.fromMap(item))
            .toList());
      }
    } catch (e) {
      print(e);
    }
  }
}
