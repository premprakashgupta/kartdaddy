import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/your_orders_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/order_details_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class YourOrdersScreen extends StatelessWidget {
  YourOrdersScreen({super.key});

  final YourOrdersController _yourOrdersController =
      Get.put(YourOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading(text: "Your Orders"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(() => OrderDetailsScreen(
                          orderId: '17109920581',
                        ));
                  },
                  leading: Image.asset("assets/kartdaddy-logo.png"),
                  title: NormalText(
                    text: "Delivered on Mar 08",
                  ),
                  subtitle: NormalText(
                    text: "Well Set...",
                  ),
                  trailing: CustomIcons.chevronRight(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(8),
                  color: CustomColors.greyColor.toColor(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(text: "Rate & Review"),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 23,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                ),
                Divider()
              ],
            );
          }),
    );
  }
}
