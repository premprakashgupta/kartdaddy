import 'package:flutter/material.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class SlantRectangle extends StatelessWidget {
  final double width;
  final String whiteText;
  final String coloredText;

  const SlantRectangle(
      {super.key,
      required this.width,
      required this.whiteText,
      required this.coloredText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CustomPaint(
        painter: SlantPainter(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: RichText(
              text: TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  text: "$whiteText  ",
                  children: [
                    TextSpan(
                        text: coloredText,
                        style:
                            TextStyle(color: CustomColors.themeColor.toColor()))
                  ]),
            ),
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
