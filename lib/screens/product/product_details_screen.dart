import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/carousel_grid.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/horizontal_row.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/slant_reactangle.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/cartController.dart';
import 'package:kartdaddy/controllers/product_details_controller.dart';
import 'package:kartdaddy/controllers/wishlist_controller.dart';
import 'package:kartdaddy/data/demo_data.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/models/cart_model.dart';
import 'package:kartdaddy/screens/cart/cart_screen.dart';
import 'package:kartdaddy/screens/product/review_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  final ProductDetailsController _productDetailsController =
      Get.put(ProductDetailsController());
  final WishListController _wishListController = Get.find();
  final CartController _cartController = Get.find();
  final productData = DemoData.demoProductData[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Heading(text: 'Product Details'),
        ),
        bottomSheet: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: CustomColors.greyColor.toColor(),
                  offset: const Offset(-2, -2),
                  blurRadius: 5)
            ]),
            width: MediaQuery.of(context).size.width,
            child: CustomButton(
              onPressed: () {
                print("cart click");
                Get.to(() => CartScreen());
              },
              child: NormalText(text: AppLocalizations.of(context)!.go_to_cart),
            )),
        body: Obx(
          () => _productDetailsController.loading.value == true
              ? const CustomCircularProgress()
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
                            color: CustomColors.blueColor.toColor(),
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
                        whiteText: 'KartDaddy\'s',
                        coloredText: 'Choice',
                      ),
                      const Gap(20),
                      Obx(
                        () => CarouselGrid(
                          data: _productDetailsController
                              .productDetail.value!.productImages,
                          percent: _productDetailsController.productDetail
                              .value!.product.discount_type_amount!,
                          favorite: _wishListController.wishlists.any(
                            (element) =>
                                element.id ==
                                _productDetailsController
                                    .productDetail.value!.product.id,
                          ),
                          height: 310,
                        ),
                      ),
                      const Gap(16),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CustomColors.redColor.toColor()),
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
                            text: AppLocalizations.of(context)!.rupee(
                                _productDetailsController.productDetail.value!
                                    .product.net_sale_amount!),
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
                              _wishListController.addWishList(
                                  product: _productDetailsController
                                      .productDetail.value!.product);
                            },
                            child: _wishListController.wishlists.any(
                                      (element) =>
                                          element.id ==
                                          _productDetailsController
                                              .productDetail.value!.product.id,
                                    ) ==
                                    true
                                ? NormalText(
                                    text: AppLocalizations.of(context)!
                                        .added_to_wishlist)
                                : NormalText(
                                    text: AppLocalizations.of(context)!
                                        .add_to_wishlist),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle compare button click
                            },
                            child: Row(
                              children: [
                                CustomIcons.compare(size: 20),
                                const Gap(5),
                                NormalText(
                                    text:
                                        AppLocalizations.of(context)!.compare),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeading(
                            text: AppLocalizations.of(context)!.color,
                            color: Colors.black,
                          ),
                          Row(
                            children: List.generate(3, (index) {
                              var color = [
                                CustomColors.redColor.toColor(),
                                CustomColors.blueColor.toColor(),
                                Colors.green
                              ];
                              return Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            CustomColors.borderColor.toColor(),
                                        width: 2),
                                    color: color[index]),
                              );
                            }),
                          )
                        ],
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeading(
                            text: AppLocalizations.of(context)!.delivery,
                            color: Colors.black,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomIcons.location(),
                                  const Gap(5),
                                  SizedBox(
                                    width: Get.size.width * .4,
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
                                      text: "Check",
                                      color: CustomColors.blueColor.toColor(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const Gap(5),
                              const NormalText(
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
                      SubHeading(
                        text: AppLocalizations.of(context)!.product_description,
                        color: Colors.black,
                      ),
                      const Gap(10),
                      HtmlWidget(
                        enableCaching: true,
                        _productDetailsController
                            .productDetail.value!.product.short_description!,
                        textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),

                      const Gap(32),
                      SubHeading(
                        text: AppLocalizations.of(context)!.available_offers,
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
                      const Gap(20),
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
                              NormalText(
                                  text: AppLocalizations.of(context)!.quantity),
                              IconButton(
                                onPressed: _cartController.cart.any((element) =>
                                        element.product_id ==
                                        _productDetailsController
                                            .productDetail.value!.product.id
                                            .toString())
                                    ? null
                                    : () {
                                        // Handle quantity decrease
                                        _productDetailsController
                                            .decreamentQuantity();
                                      },
                                icon: const Icon(Icons.remove),
                              ),
                              NormalText(
                                  text: _productDetailsController.quantity.value
                                      .toString()),
                              IconButton(
                                onPressed: _cartController.cart.any((element) =>
                                        element.product_id ==
                                        _productDetailsController
                                            .productDetail.value!.product.id
                                            .toString())
                                    ? null
                                    : () {
                                        // Handle quantity increase
                                        _productDetailsController
                                            .increamentQuantity();
                                      },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(16),
                      CustomButton(
                        onPressed: _cartController.cart.any((element) =>
                                element.product_id ==
                                _productDetailsController
                                    .productDetail.value!.product.id
                                    .toString())
                            ? null
                            : () {
                                Map<String, dynamic> mapData = {
                                  "id": 1,
                                  "product_id": _productDetailsController
                                      .productDetail.value!.product.id
                                      .toString(),
                                  "quantity": _productDetailsController
                                      .quantity.value
                                      .toString(),
                                  "total_price": _productDetailsController
                                      .total.value
                                      .toString(),
                                  "walletAmountUsed": null,
                                  "product_price": _productDetailsController
                                      .productDetail
                                      .value!
                                      .product
                                      .net_sale_amount,
                                  "product": _productDetailsController
                                      .productDetail.value!.product
                                      .toMap()
                                };
                                CartModel cartData = CartModel.fromMap(mapData);

                                _cartController.addToCart(cartitem: cartData);
                              },
                        child: NormalText(
                            text: AppLocalizations.of(context)!.add_to_cart),
                      ),
                      const Gap(16),
                      DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              indicatorColor: CustomColors.themeColor.toColor(),
                              labelColor: CustomColors.themeColor.toColor(),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              indicatorPadding: EdgeInsets.zero,
                              tabs: const [
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
                                      child: HtmlWidget(
                                    enableCaching: true,
                                    _productDetailsController.productDetail
                                        .value!.product.short_description!,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )),
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
                      const Gap(20),
                      const SubHeading(
                        text: "Related Products",
                        color: Colors.black,
                      ),
                      const Gap(10),
                      HorizontalRow(
                          data: _productDetailsController
                              .productDetail.value!.relatedProducts),

                      // fixed this gap for clear screen visibility
                      const Gap(80)
                    ],
                  ),
                ),
        ));
  }
}
