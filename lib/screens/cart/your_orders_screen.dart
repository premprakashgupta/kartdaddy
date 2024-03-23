import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/your_orders_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/models/your_orders_model.dart';
import 'package:kartdaddy/screens/cart/order_details_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class YourOrdersScreen extends StatelessWidget {
  YourOrdersScreen({super.key});

  final YourOrdersController _yourOrdersController =
      Get.put(YourOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(text: "Your Orders"),
      ),
      body: Obx(() {
        if (_yourOrdersController.loading.value == true) {
          return const CustomCircularProgress();
        }
        return ListView.builder(
            itemCount: _yourOrdersController.orderList.length,
            itemBuilder: (context, index) {
              YourOrdersModel data = _yourOrdersController.orderList[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(() => OrderDetailsScreen(
                            orderId: data.order_id,
                          ));
                    },
                    leading: Image.asset("assets/kartdaddy-logo.png"),
                    title: NormalText(
                      text: data.status,
                    ),
                    subtitle: NormalText(
                      text: data.product_name,
                    ),
                    trailing: CustomIcons.chevronRight(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(8),
                    color: CustomColors.greyColor.toColor(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const NormalText(text: "Rate & Review"),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 23,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
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
                  const Divider()
                ],
              );
            });
      }),
    );
  }
}
