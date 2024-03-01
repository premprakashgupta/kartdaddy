import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/box_shadow_container.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/data/demo_data.dart';
import 'package:kartdaddy/models/trending_products_model.dart';

import '../controllers/trending_product_controller.dart';

class TrendingProductsScreen extends StatelessWidget {
  final String slug;
  final TrendingProductsController _trendingProductsController;
  TrendingProductsScreen({super.key, required this.slug})
      : _trendingProductsController =
            Get.put(TrendingProductsController(slug: slug));

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: NormalText(
          text: "Trending Products",
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => Center(
          child: _trendingProductsController.loading.value == true
              ? Center(child: CircularProgressIndicator())
              : Wrap(
                  children: List.generate(
                      _trendingProductsController.trendingProducts.length,
                      (index) {
                    Trendingproductsmodel data =
                        _trendingProductsController.trendingProducts[index];
                    return Container(
                      margin: const EdgeInsets.all(8),
                      width: 180,
                      child: BoxBorderContainer(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: NormalText(text: data.category_name!)),
                            const Gap(8),
                            Heading(
                              text: data.title!,
                              maxLines: 2,
                            ),
                            Gap(20),
                            Image.network(
                              height: 100,
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: () {
                                    // Handle refresh action when image fails to load
                                  },
                                );
                              },
                              DemoData.slideImage[index],
                              fit: BoxFit.cover,
                            ),
                            Gap(20),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: SubHeading(text: data.sale_price!)),
                            const Gap(6),
                          ],
                        ),
                      )),
                    );
                  }),
                ),
        ),
      
      )),
    );
  }
}
