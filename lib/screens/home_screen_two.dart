import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/grey_bg_box.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenTwo extends StatelessWidget {
  const HomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading(
          text: "Home Screen",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: Get.size.height * .15,
                      alignment: Alignment.topCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcons.location(),
                          const Gap(15),
                          SizedBox(
                            width: Get.size.width * .6,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Enter delivery Code",
                                label: Text(
                                  "Enter delivery Code",
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          TextButton(
                            onPressed: () {},
                            child: NormalText(
                              text: "Apply",
                              color: CustomColors.blueColor.toColor(),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                color: CustomColors.themeColor.toColor(),
                child: Row(
                  children: [
                    CustomIcons.location(size: 20),
                    NormalText(text: "Deliver to PREM - State 000000"),
                    CustomIcons.downArrow(size: 20),
                  ],
                ),
              ),
            ),
            Container(
              height: 90,
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 14) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_horiz_outlined)),
                            NormalText(text: 'More')
                          ],
                        ),
                      );
                    }
                    return Container(
                      // width: 30,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(right: 10),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: CachedNetworkImage(
                              width: 30,
                              imageUrl:
                                  "https://m.media-amazon.com/images/I/41GsqdiCvOL._AC_SY200_.jpg",
                            ),
                          ),
                          NormalText(text: "Prime")
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 510,
              child: Stack(
                children: [
                  CarouselSlider(
                    options:
                        CarouselOptions(height: 300.0, viewportFraction: 1),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: Image.network(
                                "https://economictimes.indiatimes.com/thumb/msid-100018808,width-1200,height-900,resizemode-4,imgsize-35886/biggest-deals-on-phone-accessories.jpg?from=mdr"),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 270,
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.white,
                            blurRadius: 15,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  4,
                                  (index) => Container(
                                        height: 10,
                                        width: 10,
                                        margin: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: CustomColors.borderColor
                                                    .toColor())),
                                      )),
                            ),
                          ),
                          Gap(10),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 155,
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(2, 5),
                                          color: Colors.black12,
                                          blurRadius: 1,
                                        ),
                                        BoxShadow(
                                          offset: Offset(-2, -5),
                                          color: Colors.black12,
                                          blurRadius: 1,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SubHeading(
                                          text:
                                              "Keep shopping for Audio & cideo remotes",
                                          maxLines: 2,
                                        ),
                                        Gap(10),
                                        Center(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.contain,
                                            width: 110,
                                            imageUrl:
                                                "https://m.media-amazon.com/images/I/41GsqdiCvOL._AC_SY200_.jpg",
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: CustomColors.redColor.toColor(),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          maxWidth: Get.size.width.toInt(),
                          "https://economictimes.indiatimes.com/thumb/msid-100018808,width-1200,height-900,resizemode-4,imgsize-35886/biggest-deals-on-phone-accessories.jpg?from=mdr"))),
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.black.withOpacity(.3),
                child: Center(
                  child: CustomIcons.playOutline(color: Colors.white, size: 45),
                ),
              ),
            ),
            Divider(),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Heading(text: "Deal for you"),
                )),
            Gap(10),
            Wrap(
              children: [
                GreyBgBox(
                  width: Get.size.width * .48,
                  child: Text("data"),
                ),
                GreyBgBox(
                  width: Get.size.width * .48,
                  child: Text("data"),
                ),
                GreyBgBox(
                  width: Get.size.width * .48,
                  child: Text("data"),
                ),
                GreyBgBox(
                  width: Get.size.width * .48,
                  child: Text("data"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
