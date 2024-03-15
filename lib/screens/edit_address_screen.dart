import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/address_controller.dart';

class EditAddressScreen extends StatelessWidget {
  final int id;
  EditAddressScreen({Key? key, required this.id}) : super(key: key);

  final AddressController _addressController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading(text: "Edit Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                for (var controllerData in _addressController.inputControllers)
                  TextFormField(
                    controller: controllerData['controller'],
                    decoration:
                        InputDecoration(labelText: controllerData['label']),
                  ),
                Gap(20),
                ElevatedButton(
                  onPressed: () {
                    // Access data from controllers
                    _addressController.updateAddress(id: id);
                  },
                  child: Text("Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
