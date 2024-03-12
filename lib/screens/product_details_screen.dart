import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/carousel_grid.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/custom_input.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/horizontal_row.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/slant_reactangle.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/product_details_controller.dart';
import 'package:kartdaddy/data/demo_data.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/cart_screen.dart';
import 'package:kartdaddy/screens/review_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String slug;
  final String timestamp;
  final ProductDetailsController _productDetailsController;

  ProductDetailsScreen({super.key, required this.slug, required this.timestamp})
      : _productDetailsController =
            Get.put(ProductDetailsController(slug: slug, timestamp: timestamp));

  final productData = DemoData.demoProductData[0];

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
                Get.to(() => CartScreen());
              },
              child: const NormalText(text: "Go to Kart"),
            )),
        body: Obx(
          () => _productDetailsController.loading.value == true
              ? CustomCircularProgress()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeading(
                            text: _productDetailsController
                                .productDetail.value!.product.category_name!,
                            color: Colors.blue.shade300,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),
                              const Gap(4),
                              NormalText(
                                  text:
                                      '${productData['rating']} (${productData['customerCount']} ratings)'),
                            ],
                          ),
                        ],
                      ),
                      Heading(
                        text: _productDetailsController
                            .productDetail.value!.product.title!,
                        maxLines: 4,
                      ),
                      const Gap(30),
                      const SlantRectangle(
                        width: 150,
                      ),
                      const Gap(20),
                      CarouselGrid(
                        data: _productDetailsController
                            .productDetail.value!.productImages,
                        percent: _productDetailsController
                            .productDetail.value!.product.discount_type_amount!,
                        favorite: true,
                      ),
                      const Gap(16),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red.shade800),
                        child: const NormalText(
                          text: "Limited time deal",
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          NormalText(
                            text:
                                '\$${_productDetailsController.productDetail.value!.product.net_sale_amount!}',
                            size: 27,
                            fontWeight: FontWeight.w600,
                          ),
                          const Gap(20),
                          Text(
                            'M.R.P.: ${productData['crossPrice']}',
                            style: const TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      const Gap(16),
                      NormalText(
                          text:
                              'Availability: ${productData['availability']} in stock'),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle wishlist button click
                            },
                            child: Row(
                              children: [
                                CustomIcons.heart(size: 20),
                                Gap(5),
                                const NormalText(text: 'Add to Wishlist'),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle compare button click
                            },
                            child: Row(
                              children: [
                                CustomIcons.compare(size: 20),
                                Gap(5),
                                const NormalText(text: 'Compare'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeading(
                            text: "Color",
                            color: Colors.black,
                          ),
                          Row(
                            children: List.generate(3, (index) {
                              var color = [
                                Colors.red,
                                Colors.blue,
                                Colors.green
                              ];
                              return Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.amber, width: 2),
                                    color: color[index]),
                              );
                            }),
                          )
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeading(
                            text: "Delivery",
                            color: Colors.black,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomIcons.location(),
                                  Gap(5),
                                  SizedBox(
                                    width: Get.size.width * .4,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Enter delivery Code",
                                        label: Text(
                                          "Enter delivery Code",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(5),
                                  TextButton(
                                    onPressed: () {},
                                    child: NormalText(
                                      text: "Check",
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Gap(5),
                              NormalText(
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                                text:
                                    "Delivery by 12 March,Tuesday | free \$40",
                                color: Colors.black,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Gap(32),
                      const SubHeading(
                        text: 'Product Description',
                        color: Colors.black,
                      ),
                      const Gap(10),
                      NormalText(
                        text: _productDetailsController
                            .productDetail.value!.product.short_description!,
                        maxLines: 5,
                      ),
                      
                      const Gap(32),
                      const SubHeading(
                        text: 'Available Offers',
                        color: Colors.black,
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_offer_sharp,
                            size: 20,
                            color: Colors.green,
                          ),
                          const Gap(10),
                          NormalText(text: productData['offer1']),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_offer_sharp,
                            size: 20,
                            color: Colors.green,
                          ),
                          const Gap(10),
                          NormalText(text: productData['offer2']),
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton<String>(
                            value: productData['selectedColor'],
                            onChanged: (String? newValue) {
                              print("color changed");
                            },
                            items: productData['availableColors']
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
                                  // Handle quantity decrease
                                  if (productData['quantity'] > 1) {
                                    productData['quantity']--;
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              NormalText(
                                  text: productData['quantity'].toString()),
                              IconButton(
                                onPressed: () {
                                  // Handle quantity increase
                                  productData['quantity']++;
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
                              height:
                                  400, // Adjust the height of the tab content
                              child: TabBarView(
                                children: [
                                  // Implement the content for each tab as needed
                                  Container(
                                      child: const NormalText(
                                          text: 'Accessories Tab Content')),
                                  Container(
                                      child: NormalText(
                                          maxLines: 15,
                                          text: _productDetailsController
                                              .productDetail
                                              .value!
                                              .product
                                              .short_description!)),
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
                      Gap(20),
                      SubHeading(
                        text: "Related Products",
                        color: Colors.black,
                      ),
                      Gap(10),
                      HorizontalRow(
                          data: _productDetailsController
                              .productDetail.value!.relatedProducts),

                      // fixed this gap for clear screen visibility
                      Gap(80)
                    ],
                  ),
                ),
        ));
  }
}
