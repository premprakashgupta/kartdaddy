import 'package:flutter/material.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class BoxBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  const BoxBorderContainer(
      {super.key, required this.child, this.borderRadius = 8, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
          border:
              Border.all(width: 1, color: CustomColors.borderColor.toColor())
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
