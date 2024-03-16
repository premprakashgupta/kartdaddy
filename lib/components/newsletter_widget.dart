import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class NewsLetterWidget extends StatelessWidget {
  const NewsLetterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      color: CustomColors.themeColor.toColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalText(
            text: AppLocalizations.of(context)!.signup_for_newsletter,
            size: 22,
          ),
          const Gap(30),
          RichText(
            text: const TextSpan(
              text: '...and recieve ',
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: '\$20 coupon for shopping',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Gap(30),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Email address", border: InputBorder.none),
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 120,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      )))
            ],
          ),
          const Gap(20)
        ],
      ),
    );
  }
}
