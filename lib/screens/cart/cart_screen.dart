import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/cartController.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/models/cart_model.dart';
import 'package:kartdaddy/screens/address/address_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:kartdaddy/screens/empty_screens/empty_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Obx(() => _cartController.loading.value == true
          ? const CustomCircularProgress()
          : _cartController.cart.isEmpty
              ? const EmptyScreen(
                  title: 'Add Product in Cart',
                )
              : ListView.builder(
                  itemCount: _cartController.cart.length,
                  itemBuilder: (context, index) {
                    CartModel cartItem = _cartController.cart[index];

                    return Dismissible(
                      key: Key(cartItem.id.toString()),
                      onDismissed: (direction) {
                        print("dismiss in action");
                      },
                      child: BoxBorderContainer(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 13),
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          height: 300,
                          child: Row(
                            children: [
                              // First 40% section
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl:
                                            "https://kartdaddy.in/products/product/${cartItem.product.thumb_image}",
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CustomCircularProgress(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                      Container(
                                        // width: MediaQuery.of(context).size.width*.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                width: 1,
                                                color: CustomColors.borderColor
                                                    .toColor())),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8)),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      CustomColors.greyColor
                                                          .toColor(),
                                                      Colors.white
                                                    ],
                                                    begin:
                                                        Alignment.bottomRight,
                                                    end: Alignment.topLeft,
                                                  ),
                                                ),
                                                child: int.parse(
                                                            cartItem.quantity) <
                                                        2
                                                    ? InkWell(
                                                        onTap: () {
                                                          _cartController
                                                              .removeFromcart(
                                                                  productId:
                                                                      cartItem
                                                                          .product_id);
                                                        },
                                                        child: const Icon(
                                                            Icons.delete,
                                                            size: 19))
                                                    : InkWell(
                                                        onTap: () {
                                                          _cartController
                                                              .decreamentQuantity(
                                                            product_id: cartItem
                                                                .product_id,
                                                          );
                                                        },
                                                        child: const Icon(
                                                            Icons
                                                                .minimize_outlined,
                                                            size: 19),
                                                      ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    border: Border.symmetric(
                                                        vertical: BorderSide(
                                                            width: 1,
                                                            color: CustomColors
                                                                .borderColor
                                                                .toColor()))),
                                                child: Text(
                                                  cartItem.quantity,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8)),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      CustomColors.greyColor
                                                          .toColor(),
                                                      Colors.white
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    _cartController
                                                        .increaseQuantity(
                                                      product_id:
                                                          cartItem.product_id,
                                                    );
                                                  },
                                                  child: const Icon(Icons.add,
                                                      size: 19),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Second 60% section
                              Flexible(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          NormalText(
                                            text: cartItem.product.title!,
                                            maxLines: 2,
                                          ),
                                          const Gap(10),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    color: CustomColors.redColor
                                                        .toColor()),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .percent_discount(cartItem
                                                          .product
                                                          .discount_type_amount
                                                          .toString()),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Gap(10),
                                              Text(
                                                "Limited time deal",
                                                style: TextStyle(
                                                    color: CustomColors.redColor
                                                        .toColor(),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          NormalText(
                                            text:
                                                'Price: ${cartItem.total_price}',
                                            size: 15,
                                          ),
                                          const NormalText(
                                            text: 'In Stock',
                                            size: 15,
                                          ),
                                          NormalText(
                                            text: '7 Day Replacement',
                                            size: 15,
                                            color: Colors.blue.shade600,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            // Add your logic for deleting
                                            _cartController.removeFromcart(
                                                productId: cartItem.product_id);
                                            print("remove in acton");
                                          },
                                          child: NormalText(
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .delete,
                                              size: 13),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            _cartController.saveForLater(
                                                productId: cartItem.product_id);
                                          },
                                          child: NormalText(
                                            text: AppLocalizations.of(context)!
                                                .save_for_later,
                                            size: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
      bottomNavigationBar: Obx(() => Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: CustomColors.greyColor.toColor(),
                  offset: const Offset(-2, -2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: NormalText(
                        size: 20,
                        text: AppLocalizations.of(context)!
                            .rupee(_cartController.total.toString())),
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomButton(
                      onPressed: _cartController.cart.isEmpty
                          ? null
                          : () {
                              Get.to(() => AddressScreen(
                                    throughOrder: true,
                                  ));
                              print('Checkout button pressed!');
                            },
                      child: NormalText(
                          text: AppLocalizations.of(context)!.checkout),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
