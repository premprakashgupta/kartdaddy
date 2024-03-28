import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class GreyBgBox extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final double? width;
  const GreyBgBox(
      {super.key,
      required this.child,
      this.borderRadius = 0,
      this.margin,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: [
          Container(
            height: 160,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CustomColors.greyColor.toColor(),
            ),
            child: Center(
              child: CachedNetworkImage(
                  imageUrl:
                      "https://m.media-amazon.com/images/I/41GsqdiCvOL._AC_SY200_.jpg"),
            ),
          ),
          Gap(10),
          Row(
            children: [
              Container(
                width: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.all(4),
                color: CustomColors.redColor.toColor(),
                child: NormalText(
                  text: "32% off",
                  color: Colors.white,
                  size: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(5),
              NormalText(
                text: "Limited time deal",
                color: CustomColors.redColor.toColor(),
                fontWeight: FontWeight.w600,
              )
            ],
          )
        ],
      ),
    );
  }
}
