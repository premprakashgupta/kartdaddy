import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class Heading extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final int? maxLines;
  const Heading(
      {super.key,
      required this.text,
      this.size = 20,
      this.color,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: size,
              color: color ?? CustomColors.textColor.toColor(),
              fontWeight: FontWeight.w500)),
    );
  }
}
