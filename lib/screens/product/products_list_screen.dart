import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/models/product_model.dart';
import 'package:kartdaddy/shimmer/grid_shimmer.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controllers/products_list_controller.dart';

class ProductsListScreen extends StatelessWidget {
  final String slug;
  final String title;
  final ProductsListController _ProductsListController;

  ProductsListScreen({super.key, required this.slug, required this.title})
      : _ProductsListController = Get.put(ProductsListController(slug: slug));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading(
          text: title,
        ),
        elevation: 5,
      ),
      body: Obx(
        () => _ProductsListController.loading.value == true
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
                itemCount: _ProductsListController.products.length,
                itemBuilder: (context, index) {
                  ProductModel data = _ProductsListController.products[index];
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
                                  color: CustomColors.blueColor.toColor(),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SubHeading(
                                    text: AppLocalizations.of(context)!.rupee(
                                        data.net_sale_amount.toString())),
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
