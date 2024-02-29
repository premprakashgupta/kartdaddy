import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/home_controller.dart';
import 'package:kartdaddy/data/demo_data.dart';
import 'package:kartdaddy/designs/custom_icons.dart';


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
                    itemCount: DemoData.slideImage.length, // Number of images
                    itemBuilder: (context, index) {
                      // Replace this with your actual image loading logic
                      return Column(
                        children: [
                          Image.network(
                            height:200,
                            DemoData.slideImage[index],
                            fit: BoxFit.cover,
                          ),
                          const SubHeading(text: "Printers"),
                          const Gap(10),
                          const NormalText(text: "7 Products")
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
