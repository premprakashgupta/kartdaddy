import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/data/demo_data.dart';

import '../components/normal_text_widget.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5, // Replace with the actual number of reviews
        itemBuilder: (context, index) {
          return buildReviewItem(); // Implement a function to build each review item
        },
      );
  }

  Widget buildReviewItem() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(DemoData.slideImage[0]),
                  // Replace 'URL_TO_PROFILE_PICTURE' with the actual URL to the profile picture
                ),
                const Gap( 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(text:'User Name'),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Gap( 4),
                        NormalText(text:'4.5'), // Replace with the actual rating
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Gap( 8),
            const NormalText(text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget tincidunt dui.',
            ), // Replace with the actual review text
            const Gap( 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {
                        // Handle like button click
                      },
                    ),
                    const NormalText(text:'15'), // Replace with the actual number of likes
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_down),
                      onPressed: () {
                        // Handle dislike button click
                      },
                    ),
                    const NormalText(text:'3'), // Replace with the actual number of dislikes
                  ],
                ),
              ],
            ),
            const Gap( 8),
            buildMediaRow(), // Implement a function to build the media row
          ],
        ),
      ),
    );
  }

  Widget buildMediaRow() {
    // Implement a widget to display images or video thumbnails shared by the user
    // This can be a Row with a list of Image or VideoThumbnail widgets
    return Row(
      children: [
        Image.network(DemoData.slideImage[0],height: 60,), // Replace with actual URL to the first thumbnail
        const Gap( 8),
        Image.network(DemoData.slideImage[1],height: 60,), // Replace with actual URL to the second thumbnail
        // Add more thumbnails as needed
      ],
    );
  }
}
