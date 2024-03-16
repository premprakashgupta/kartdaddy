import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class SubHeading extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final int? maxLines;

  const SubHeading({
    super.key,
    required this.text,
    this.size = 18,
    this.color, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: size,
              color: color ?? CustomColors.subTextColor.toColor(),
              fontWeight: FontWeight.w400)),
    );
  }
}
