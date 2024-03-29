import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/product_api.dart';
import 'package:kartdaddy/models/address_model.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/utility/custom_snackbar.dart';

class AddressController extends GetxController {
  final List<Map<String, dynamic>> inputControllers = [
    {
      'label': "First Name",
      'field': "first_name",
      'controller': TextEditingController(),
    },
    {
      'label': "Last Name",
      'field': "last_name",
      'controller': TextEditingController(),
    },
    {
      'label': "Address",
      'field': "address",
      'controller': TextEditingController(),
    },
    {
      'label': "Type",
      'field': "type",
      'controller': TextEditingController(),
    },
    {
      'label': "Country",
      'field': "country",
      'controller': TextEditingController(),
    },
    {
      'label': "State",
      'field': "state",
      'controller': TextEditingController(),
    },
    {
      'label': "City",
      'field': "city",
      'controller': TextEditingController(),
    },
    {
      'label': "Pin Code",
      'field': "pin_code",
      'controller': TextEditingController(),
    },
    {
      'label': "Email",
      'field': "email",
      'controller': TextEditingController(),
    },
    {
      'label': "Mobile",
      'field': "mobile",
      'controller': TextEditingController(),
    },
  ];

  GetStorage box = GetStorage();
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
      http.Response response = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $_token'});
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        
        addressList.assignAll((jsonData['addresses'] as List<dynamic>)
            .map((item) => AddressModel.fromMap(item))
            .toList());
      }
    } catch (e) {
      print(e);
    }
  }

  void addAddress() async {
    try {
      Map<String, String> addressData = {};
      for (var controllerData in inputControllers) {
        addressData[controllerData['field']] =
            controllerData['controller'].text;
      }
     

      String url = ProductApi.addAddress;
      http.Response response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'}, body: addressData);
     
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body);
        
        addressList.add(AddressModel.fromMap(jsonData['address']));
        for (var controllerData in inputControllers) {
          TextEditingController controller = controllerData['controller'];
          controller.clear();
        }
        CustomSnackbar.showSnackbar(
            title: "Address", message: jsonData['message']);
        Get.back();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void preFillingEditScreenInput({required int id}) {
    var existingAddress =
        addressList.firstWhere((element) => element.id == id).toMap();
    for (var controllerData in inputControllers) {
      TextEditingController controller = controllerData['controller'];
      controller.text = existingAddress[controllerData['field']];
    }
  }

  void updateAddress({required int id}) async {
    try {
      Map<String, String> newAddressData = {};
      for (var controllerData in inputControllers) {
        newAddressData[controllerData['field']] =
            controllerData['controller'].text;
      }
      

      String url = ProductApi.updateAddress(id);
      http.Response response = await http.put(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'}, body: newAddressData);
      
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body);
        

        int index = addressList.indexWhere((element) => element.id == id);
        addressList[index] = AddressModel.fromMap(jsonData['address']);
        Get.back();
        CustomSnackbar.showSnackbar(
            title: "Address", message: jsonData['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void removeAddress({required int id}) async {
    try {
      String url = ProductApi.removeAddress(id);
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $_token'},
      );
      
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body);
       
        addressList.removeWhere((element) => element.id == id);

        CustomSnackbar.showSnackbar(
            title: "Address", message: jsonData['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
  void setDefault({required int id}) async {
    try {
      String url = ProductApi.setDefault(id);
      http.Response response = await http.put(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $_token'},
      );
     
      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body);
       
        addressList.assignAll((jsonData['addresses'] as List<dynamic>)
            .map((item) => AddressModel.fromMap(item))
            .toList());

        CustomSnackbar.showSnackbar(
            title: "Address", message: jsonData['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    for (var controllerData in inputControllers) {
      TextEditingController controller = controllerData['controller'];
      controller.dispose();
    }

    super.onClose();
  }
}
