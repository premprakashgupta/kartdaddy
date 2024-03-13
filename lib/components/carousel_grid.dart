import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';

class CarouselGrid extends StatefulWidget {
  final List<String> data;
  final String percent;
  final bool favorite;

  const CarouselGrid(
      {super.key,
      required this.data,
      required this.percent,
      required this.favorite});

  @override
  _CarouselGridState createState() => _CarouselGridState();
}

class _CarouselGridState extends State<CarouselGrid> {
  final CarouselController _carouselController = CarouselController();
  int _currentThumbnailIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 300.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentThumbnailIndex = index;
                    });
                  },
                ),
                items: widget.data.map((img) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: CustomColors.slideColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            height: 150,
                            imageUrl: img,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CustomCircularProgress(
                                  value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              // circular discount box
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red.shade800,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: "${widget.percent}%",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    const NormalText(
                      text: "off",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 1), // changes the position of the shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40)),
                    child: CustomIcons.share()),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 1), // changes the position of the shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40)),
                    child: CustomIcons.heart(
                        color: widget.favorite == true
                            ? Colors.red.shade700
                            : Colors.grey.shade300)),
              )
            ],
          ),
          const Gap(10),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.data.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  _carouselController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: _currentThumbnailIndex == index
                              ? Colors.grey
                              : Colors.transparent),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.data[index],
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CustomCircularProgress(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
