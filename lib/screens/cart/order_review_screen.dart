import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/order_review_controller.dart';
import 'package:kartdaddy/models/order_review_model.dart';
import 'package:kartdaddy/screens/payment/payment_method_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderReviewScreen extends StatelessWidget {
  final int addressId;
  OrderReviewScreen({super.key, required this.addressId});

  final OrderReviewController _orderReviewController =
      Get.put(OrderReviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          OrderReviewModel data = _orderReviewController.reviewOrderData.value!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // First Box: Order Summary
              BoxBorderContainer(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText(text: 'Total Price:'),
                          NormalText(text: data.order_summary.total.toString()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText(text: 'Delivery Charge:'),
                          NormalText(
                              text: data.order_summary.delivery_charge
                                  .toString()),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const NormalText(text: 'Total:'),
                          NormalText(
                              text:
                                  data.order_summary.payable_amount.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Second Box: Address
              BoxBorderContainer(
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
                                    "${data.address.first_name} ${data.address.last_name}",
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              NormalText(text: "Type: ${data.address.type}"),
                              NormalText(text: "Pin ${data.address.pin_code}"),
                            ],
                          ),
                          NormalText(text: "Country ${data.address.country}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NormalText(
                                  text: "Phone number: ${data.address.mobile}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Proceed Button
              CustomButton(
                onPressed: () {
                  Get.to(() => const PaymentMethodScreen());
                },
                child: Text(AppLocalizations.of(context)!.proceed),
              ),
            ],
          );
        }),
      ),
    );
  }
}
