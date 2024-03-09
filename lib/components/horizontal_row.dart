import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/models/product_model.dart';

class HorizontalRow extends StatelessWidget {
  final List<dynamic> data;
  const HorizontalRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(data.length, (idx) {
          ProductModel product = data[idx];
          return Container(
            margin: const EdgeInsets.all(8),
            width: Get.size.width / 2,
            height: 340,
            child: BoxBorderContainer(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: NormalText(
                        text: product.category_name!,
                        color: Colors.blue.shade300,
                      )),
                  const Gap(8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SubHeading(
                      text: product.title!,
                      maxLines: 2,
                      color: Colors.black,
                    ),
                  ),
                  Gap(20),
                  CachedNetworkImage(
                    height: 120,
                    imageUrl:
                        "https://kartdaddy.in/products/product/${product.thumb_image}",
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Gap(20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SubHeading(
                          text: "${product.net_sale_amount} INR")),
                  const Gap(6),
                ],
              ),
            )),
          );
        }),
      ),
    );
  }
}
