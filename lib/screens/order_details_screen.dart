import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_shadow_container.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/order_details_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final OrderDetailsController _yourOrdersController;
  OrderDetailsScreen({super.key, required this.orderId})
      : _yourOrdersController =
            Get.put(OrderDetailsController(orderId: orderId));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading(
          text: "Order details",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: NormalText(
                  text: "Order ID - OD42973413xxxxxxxxxx",
                ),
              ),
            ),
            Divider(),
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
                            text: "iyurvadik Orgabnic lorem ipsum wonder hey",
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
                    Gap(5),
                    NormalText(text: "Seller: SugandhMart"),
                    SubHeading(text: "Rs. 279")
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: NormalText(
                  text: "Status",
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                unratedColor: CustomColors.greyColor.toColor(),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {},
              child: NormalText(
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
              title: Heading(
                text: "Invoice download",
              ),
              trailing: CustomIcons.chevronRight(),
            ),
            Container(
              width: Get.size.width,
              height: 5,
              color: Colors.grey.shade300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: NormalText(
                  text: "Shipping Details",
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: NormalText(
                  text: "Price Details",
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
        ),
      ),
    );
  }
}
