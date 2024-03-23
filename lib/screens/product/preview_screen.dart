import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/carousel_grid.dart';
import 'package:kartdaddy/components/heading_widget.dart';

class PreviewScreen extends StatelessWidget {
  final List<String> data;
  const PreviewScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(text: "Preview"),
      ),
      body: CarouselGrid(
        data: data,
        percent: null,
        favorite: null,
        height: Get.size.height - 200,
      ),
    );
  }
}
