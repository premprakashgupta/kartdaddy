import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Heading(text: "Empty Cart"),
            Gap(20),
            CustomButton(
                onPressed: () {
                  Get.back();
                },
                child: NormalText(text: "Go back"))
          ],
        ),
      ),
    );
  }
}
