import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/address_controller.dart';
import 'package:kartdaddy/models/address_model.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final AddressController _addressController = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Screen'),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-2, -2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: CustomButton(
            onPressed: () {},
            child: const NormalText(
              text: "Add New Address",
            ),
          ),
        ),
      ),
      body: Obx(() => ListView.builder(
            itemCount: _addressController.addressList.length,
        itemBuilder: (context, index) {
              AddressModel address = _addressController.addressList[index];
          return BoxBorderContainer(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                              SubHeading(
                                text:
                                    "${address.first_name} ${address.last_name}",
                                color: Colors.black,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: Text(
                              //         addresses[index].isDefault ? 'Default' : '',
                              //         style: TextStyle(
                              //           color: addresses[index].isDefault
                              //               ? Colors.green
                              //               : Colors.transparent,
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       ),
                              //     ),
                              //     Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: Checkbox(
                              //         value: addresses[index].isDefault,
                              //         onChanged: (value) {
                              //           setState(() {
                              //             for (var addr in addresses) {
                              //               addr.isDefault = false;
                              //             }
                              //             addresses[index].isDefault = value!;
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                          Row(
                            children: [
                              NormalText(text: "Type: ${address.type}"),
                              NormalText(text: "Pin ${address.pin_code}"),

                        ],
                      ),
                          NormalText(text: "Country ${address.country}"),
                          NormalText(text: "Phone number: ${address.mobile}"),
                    ],
                  ),
                    ),
              ],
            ),
          );
        },
          )),
    );
  }
}
