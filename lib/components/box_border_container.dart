import 'package:flutter/material.dart';

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
        border: Border.all(width: 1,color: Colors.grey.shade300)
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
