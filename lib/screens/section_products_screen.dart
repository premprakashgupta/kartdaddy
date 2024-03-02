import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/models/section_products_model.dart';

import '../controllers/trending_product_controller.dart';

class SectionProductsScreen extends StatelessWidget {
  final String slug;
  final String title;
  final SectionProductsController _sectionProductsController;

  SectionProductsScreen({required this.slug, required this.title})
      : _sectionProductsController =
            Get.put(SectionProductsController(slug: slug));

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
        () => _sectionProductsController.loading.value == true
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of cards in one row
                  crossAxisSpacing:
                      8.0, // Adjust the spacing between cards horizontally
                  mainAxisSpacing:
                      8.0, // Adjust the spacing between cards vertically
                  childAspectRatio: 0.55, // Adjust the aspect ratio as needed
                ),
                itemCount: _sectionProductsController.trendingProducts.length,
                itemBuilder: (context, index) {
                  SectionProductsModel data =
                      _sectionProductsController.trendingProducts[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
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
                            Gap(20),
                            CachedNetworkImage(
                              imageUrl:
                                  "https://kartdaddy.in/products/product/${data.thumb_image}",
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            Gap(20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SubHeading(text: data.sale_price!),
                            ),
                            const Gap(6),
                          ],
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
