import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight;

  const NormalText({
    super.key,
    required this.text,
    this.size = 14,
    this.color,
    this.maxLines, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: size,
              color: color ?? CustomColors.textColor.toColor(),
              fontWeight: fontWeight?? FontWeight.normal)),
    );
  }
}
