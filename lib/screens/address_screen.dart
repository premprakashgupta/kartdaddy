import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/address_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/models/address_model.dart';
import 'package:kartdaddy/screens/add_address_screen.dart';
import 'package:kartdaddy/screens/edit_address_screen.dart';
import 'package:kartdaddy/screens/empty_screens/empty_screen.dart';
import 'package:kartdaddy/screens/order_review_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressScreen extends StatelessWidget {
  final bool throughOrder;
  AddressScreen({super.key, required this.throughOrder});

  final AddressController _addressController = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Screen'),
      ),
      
      body: Obx(() => _addressController.addressList.isEmpty
          ? EmptyScreen(title: "Add Address Here")
          : Column(
              children: [
                Gap(10),
                InkWell(
                  onTap: () {
                    Get.to(() => AddAddressScreen());
                  },
                  child: BoxBorderContainer(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SubHeading(text: "Add New Address"),
                      )),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _addressController.addressList.length,
                    itemBuilder: (context, index) {
                      AddressModel address =
                          _addressController.addressList[index];
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SubHeading(
                                        text:
                                            "${address.first_name} ${address.last_name}",
                                        color: Colors.black,
                                      ),
                                      throughOrder == true
                                          ? SizedBox()
                                          :
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              address.is_default == 1
                                                  ? 'Default'
                                                  : '',
                                              style: TextStyle(
                                                color: address.is_default == 1
                                                    ? Colors.green
                                                    : Colors.transparent,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Checkbox(
                                              value: address.is_default == 1
                                                  ? true
                                                  : false,
                                              onChanged: (value) {
                                                _addressController.setDefault(
                                                    id: address.id);
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      NormalText(text: "Type: ${address.type}"),
                                      NormalText(
                                          text: "Pin ${address.pin_code}"),
                                    ],
                                  ),
                                  NormalText(
                                      text: "Country ${address.country}"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      NormalText(
                                          text:
                                              "Phone number: ${address.mobile}"),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                _addressController
                                                    .preFillingEditScreenInput(
                                                        id: address.id);
                                                Get.to(() => EditAddressScreen(
                                                      id: address.id,
                                                    ));
                                              },
                                              icon: Icon(Icons.edit)),
                                          IconButton(
                                              onPressed: () {
                                                _addressController
                                                    .removeAddress(
                                                        id: address.id);
                                              },
                                              icon: Icon(Icons.delete))
                                        ],
                                      )
                                    ],
                                  ),
                                  throughOrder == true
                                      ? Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 10),
                                            child: address.is_default == 1
                                                ? CustomButton(
                                                    size: Size.fromWidth(
                                                        Get.size.width * .8),
                                                    onPressed: () {
                                                      Get.to(() =>
                                                          OrderReviewScreen(
                                                              addressId:
                                                                  address.id));
                                                    },
                                                    child: NormalText(
                                                      text: AppLocalizations.of(
                                                              context)!
                                                          .proceed_with_defaul_address,
                                                    ),
                                                  )
                                                : OutlinedButton(
                                                    onPressed: () {
                                                      Get.to(() =>
                                                          OrderReviewScreen(
                                                              addressId:
                                                                  address.id));
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      fixedSize: Size.fromWidth(
                                                          Get.size.width * .8),
                                                    ),
                                                    child: NormalText(
                                                        text:
                                                            "Choose this address")),
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
    );
  }
}
