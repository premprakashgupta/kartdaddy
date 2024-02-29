import 'dart:math';

import 'package:flutter/material.dart';

class SlantRectangle extends StatelessWidget {
  final double width;

  const SlantRectangle({super.key, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: CustomPaint(
        painter: SlantPainter(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: RichText(
              
              text: TextSpan(
                style: TextStyle( fontWeight: FontWeight.w600),
                text: "Amazon's ",children: [
                TextSpan(text: "Choice",style: TextStyle(color: Colors.amber.shade700))
              ]),),
          ),
        ),
      ),
    );
  }
}

class SlantPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height) // Bottom-left corner
      ..lineTo(0, 0) // Top-left corner
      ..lineTo(size.width, 0) // Top-right corner
      ..lineTo(size.width * .9, size.height) // Bottom-right corner
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
