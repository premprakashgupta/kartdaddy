import 'package:flutter/material.dart';

class UnderlineContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  const UnderlineContainer({Key? key, required this.child, this.color=Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color, // You can customize the color
            width: 1.0, // You can customize the width
          ),
        ),
      ),
      child: child,
    );
  }
}
