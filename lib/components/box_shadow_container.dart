import 'package:flutter/material.dart';

class BoxShadowContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  const BoxShadowContainer(
      {super.key, required this.child, this.borderRadius = 8, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 1), // changes the position of the shadow
          ),
        ],
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
