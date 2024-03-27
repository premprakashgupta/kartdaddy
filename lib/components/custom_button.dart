import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Size? size;
  final EdgeInsetsGeometry? padding;

  const CustomButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.size,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.themeColor.toColor(),
        fixedSize: size ?? Size.fromWidth(Get.size.width),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
