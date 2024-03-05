import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class GridShimmer extends StatelessWidget {
  GridShimmer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of cards in one row
          crossAxisSpacing:
              8.0, // Adjust the spacing between cards horizontally
          mainAxisSpacing: 8.0, // Adjust the spacing between cards vertically
          childAspectRatio: 0.55, // Adjust the aspect ratio as needed
        ),
        itemBuilder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // category
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                Gap(10),
                // title
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                Gap(20),
                // image
                Container(
                  width: double.infinity,
                  height: 150.0,
                  color: Colors.white,
                ),
                const Gap(18),
                // discount
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                const Gap(8),
                // price
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}
