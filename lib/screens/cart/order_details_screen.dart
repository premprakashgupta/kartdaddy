import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/order_details_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/models/order_details_model.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final OrderDetailsController _orderDetailsController;
  OrderDetailsScreen({super.key, required this.orderId})
      : _orderDetailsController =
            Get.put(OrderDetailsController(orderId: orderId));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(
          text: "Order details",
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (_orderDetailsController.loading.value == true) {
            return const CustomCircularProgress();
          }
          OrderDetailsModel? data = _orderDetailsController.orderDetails.value;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(
                    text: "OD - ${data!.order_no.toString()}",
                  ),
                ),
              ),
              const Divider(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.size.width * .7,
                            child: SubHeading(
                              text: data.product_name,
                              maxLines: 2,
                            ),
                          ),
                          Image.asset(
                            "assets/kartdaddy-logo.png",
                            height: 80,
                            width: 80,
                          )
                        ],
                      ),
                      const Gap(5),
                      const NormalText(text: "Seller: SugandhMart"),
                      SubHeading(text: data.total_price)
                    ],
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(
                    text: data.status,
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  unratedColor: CustomColors.greyColor.toColor(),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {},
                child: const NormalText(
                  text: "Need help?",
                ),
              ),
              Container(
                width: Get.size.width,
                height: 5,
                color: Colors.grey.shade300,
              ),
              ListTile(
                leading: CustomIcons.invoice(),
                title: const Heading(
                  text: "Invoice download",
                ),
                trailing: CustomIcons.chevronRight(),
              ),
              Container(
                width: Get.size.width,
                height: 5,
                color: Colors.grey.shade300,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(
                    text: "Shipping Details",
                  ),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('John Doe'),
                    Text('123 Main Street'),
                    Text('City, State, Zip Code'),
                    Text('Country'),
                  ],
                ),
              ),
              Container(
                width: Get.size.width,
                height: 5,
                color: Colors.grey.shade300,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(
                    text: "Price Details",
                  ),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Price:'),
                        Text('\$100'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Charge:'),
                        Text('\$5'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:'),
                        Text('\$105'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
