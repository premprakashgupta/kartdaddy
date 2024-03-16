import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final String? subtitle;
  const EmptyScreen({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Heading(text: title),
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
