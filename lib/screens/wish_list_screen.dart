import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/wishlist_controller.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/models/product_model.dart';
import 'package:kartdaddy/screens/product_details_screen.dart';
import 'package:kartdaddy/shimmer/grid_shimmer.dart';

import '../controllers/products_list_controller.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
  WishListController _wishListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading(
          text: "Wishlist",
        ),
        elevation: 5,
      ),
      body: Obx(
        () => _wishListController.loading.value == true
            ? const GridShimmer()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of cards in one row
                  crossAxisSpacing:
                      8.0, // Adjust the spacing between cards horizontally
                  mainAxisSpacing:
                      8.0, // Adjust the spacing between cards vertically
                  childAspectRatio: 0.55, // Adjust the aspect ratio as needed
                ),
                itemCount: _wishListController.wishlists.length,
                itemBuilder: (context, index) {
                  ProductModel data = _wishListController.wishlists[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => ProductDetailsScreen(
                        //       slug: data.slug!,
                        //       timestamp: data.timestamp!,
                        //     ));

                        Get.toNamed(
                            '/productDetails?slug=${data.slug!}&timestamp=${data.timestamp!}');
                      },
                      child: BoxBorderContainer(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: NormalText(
                                  text: data.category_name!,
                                  color: Colors.blue.shade300,
                                ),
                              ),
                              const Gap(8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SubHeading(
                                  text: data.title!,
                                  maxLines: 2,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(20),
                              CachedNetworkImage(
                                imageUrl:
                                    "https://kartdaddy.in/products/product/${data.thumb_image}",
                                placeholder: (context, url) =>
                                    const CustomCircularProgress(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              const Gap(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SubHeading(text: data.net_sale_amount!),
                                  InkWell(
                                    onTap: () {
                                      _wishListController.removeWishList(
                                          product: data);
                                    },
                                    child: CustomIcons.delete(),
                                  )
                                ],
                              ),
                              const Gap(6),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
