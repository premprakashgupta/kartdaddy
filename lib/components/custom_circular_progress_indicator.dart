import 'package:flutter/material.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class CustomCircularProgress extends StatelessWidget {
  final double? value;
  const CustomCircularProgress({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: CustomColors.themeColor.toColor(),
        value: value,
      ),
    );
  }
}
