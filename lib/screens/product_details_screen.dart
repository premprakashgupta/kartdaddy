import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/carousel_grid.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/slant_reactangle.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/data/demo_data.dart';
import 'package:kartdaddy/screens/cart_screen.dart';
import 'package:kartdaddy/screens/review_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> productData; // Replace this with your actual data

  const ProductDetailsScreen({super.key, required this.productData});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NormalText(text: 'Product Details'),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(-2, -2),
                blurRadius: 5)
          ]),
          width: MediaQuery.of(context).size.width,
          child: CustomButton(
            onPressed: () {
              print("cart click");
              Get.to(() => const CartScreen());
            },
            child: const NormalText(text: "Go to Kart"),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubHeading(
                  text: widget.productData['category'],
                  color: Colors.blue.shade300,
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    const Gap(4),
                    NormalText(
                        text:
                            '${widget.productData['rating']} (${widget.productData['customerCount']} ratings)'),
                  ],
                ),
              ],
            ),
            Heading(
              text: widget.productData['productTitle'],
              maxLines: 4,
            ),
            Gap(30),
            SlantRectangle(
              width: 150,
            ),
            Gap(20),
            CarouselGrid(data: DemoData.slideImage),
            const Gap(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                NormalText(
                  text: 'Price: \$${widget.productData['price']}',
                  size: 24,
                ),
                Gap(20),
                NormalText(text: '${widget.productData['crossPrice']}'),
              ],
            ),
            const Gap(16),
            NormalText(
                text:
                    'Availability: ${widget.productData['availability']} in stock'),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle wishlist button click
                  },
                  child: const NormalText(text: 'Add to Wishlist'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle compare button click
                  },
                  child: const NormalText(text: 'Compare'),
                ),
              ],
            ),
            const Gap(16),
            const SubHeading(
              text: 'Product Description',
              color: Colors.black,
            ),
            const Gap(8),
            NormalText(
              text: widget.productData['productDescription'],
              maxLines: 5,
            ),
            TextButton(
                onPressed: () {},
                child: const SubHeading(
                  text: "more",
                )),
            const Gap(16),
            const SubHeading(
              text: 'Available Offers',
              color: Colors.black,
            ),
            const Gap(8),
            NormalText(text: widget.productData['offer1']),
            NormalText(text: widget.productData['offer2']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: widget.productData['selectedColor'],
                  onChanged: (String? newValue) {
                    setState(() {
                      // Handle color dropdown selection
                      widget.productData['selectedColor'] = newValue!;
                    });
                  },
                  items: widget.productData['availableColors']
                      .map<DropdownMenuItem<String>>((String color) {
                    return DropdownMenuItem<String>(
                      value: color,
                      child: NormalText(text: color),
                    );
                  }).toList(),
                  hint: const NormalText(text: 'Select Color'),
                ),
                const Gap(8),
                Row(
                  children: [
                    const NormalText(text: 'Quantity: '),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          // Handle quantity decrease
                          if (widget.productData['quantity'] > 1) {
                            widget.productData['quantity']--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    NormalText(text: widget.productData['quantity'].toString()),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          // Handle quantity increase
                          widget.productData['quantity']++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(16),
            CustomButton(
              onPressed: () {
                // Handle add to cart button click
              },
              child: const NormalText(text: 'Add to Cart'),
            ),
            const Gap(16),
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Accessories'),
                      Tab(text: 'Description'),
                      Tab(text: 'Specification'),
                      Tab(text: 'Review'),
                    ],
                  ),
                  const Gap(8),
                  SizedBox(
                    height: 400, // Adjust the height of the tab content
                    child: TabBarView(
                      children: [
                        // Implement the content for each tab as needed
                        Container(
                            child: const NormalText(
                                text: 'Accessories Tab Content')),
                        Container(
                            child: const NormalText(
                                text: 'Description Tab Content')),
                        Container(
                            child: const NormalText(
                                text: 'Specification Tab Content')),
                        Container(child: const ReviewScreen()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
