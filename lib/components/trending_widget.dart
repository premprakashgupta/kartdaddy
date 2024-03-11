import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/home_controller.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/models/category_section_model.dart';

class CustomSlider extends StatelessWidget {
  final HomeController _homeController = Get.find();

  CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: IconButton(
                icon: CustomIcons.chevronLeft(),
                onPressed: () {
                  _homeController.pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            Flexible(
              flex: 5,
              child: PageView.builder(
                controller: _homeController.pageController,
                itemCount:
                    _homeController.categorySections.length, // Number of images
                itemBuilder: (context, index) {
                  CategorySectionsModel data =
                      _homeController.categorySections[index];
                  return Column(
                    children: [
                      CachedNetworkImage(
                        height: 200,
                        imageUrl: "https://kartdaddy.in/${data.image}",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      SubHeading(text: data.title),
                      const Gap(10),
                      NormalText(text: "${data.status} Products")
                    ],
                  );
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                icon: CustomIcons.chevronRight(),
                onPressed: () {
                  _homeController.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
