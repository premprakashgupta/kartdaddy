import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kartdaddy/controllers/website_info_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class FooterWidget extends StatelessWidget {
  FooterWidget({super.key});
  final WebsiteInfoController _websiteInfoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: _websiteInfoController.websiteInfo.value == null
              ? Image.asset(
                  'assets/kartdaddy-logo.png',
                  height: 40,
                )
              : SvgPicture.network(
              key: const Key("webiste footer logo"),
              "https://kartdaddy.in/${_websiteInfoController.websiteInfo.value!.headerLogo}",
              semanticsLabel: 'webiste footer logo'),
        ),
        const Gap(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.headset_mic,
                size: 44,
                color: CustomColors.themeColor.toColor(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NormalText(
                    text: "Got questions? Call us 24/7!",
                    size: 15,
                  ),
                  NormalText(
                    text: _websiteInfoController
                            .websiteInfo.value == null
                        ? ""
                        : _websiteInfoController
                            .websiteInfo.value!.alternetMobile,
                    size: 18,
                  )
                ],
              )
            ],
          ),
        ),
        const Gap(20),
        Align(
            alignment: Alignment.centerLeft,
            child: Heading(text: AppLocalizations.of(context)!.contact_info)),
        const Gap(20),
        const NormalText(
          text: "17 Princess Road, London, Greater London NW1 8JR, UK",
          maxLines: 4,
        )
      ]),
    );
  }
}
