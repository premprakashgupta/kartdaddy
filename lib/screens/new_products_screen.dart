import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/box_shadow_container.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/data/demo_data.dart';

class NewProductsScreen extends StatelessWidget {
  const NewProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: NormalText(text: "New Products",),
        elevation: 5,
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            children: List.generate(9, (index) => Container(
                                margin: const EdgeInsets.all(8),
                                width: 180,
                                child: BoxShadowContainer(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      const Align(
                                          alignment: Alignment.centerLeft,
                                          child: NormalText(text: "7 Products")),
                                      const Gap(8),
                                      const Heading(
                                          text: "Mobile Phone Accesaries"),
                                      Image.network(
                                        height: 150,
                                        DemoData.slideImage[index],
                                        fit: BoxFit.cover,
                                      ),
                                      const Align(
                                          alignment: Alignment.centerLeft,
                                          child: SubHeading(text: "11000")),
                                      const Gap(6),
                                    ],
                                  ),
                                )),
                              ),),
          ),
        ),
      ),
    );
  }
}