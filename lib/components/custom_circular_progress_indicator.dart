import 'package:flutter/material.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class CustomCircularProgress extends StatelessWidget {
  final double? value;
  const CustomCircularProgress({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: 20.0, // Adjust width to decrease or increase the radius
          height: 20.0, // Adjust height to decrease or increase the radius
          child: CircularProgressIndicator(
            color: CustomColors.themeColor.toColor(),
            value: value,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
