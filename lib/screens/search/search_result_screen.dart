import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/box_border_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/cartController.dart';
import 'package:kartdaddy/controllers/search_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/models/shop_api_model.dart';
import 'package:kartdaddy/screens/empty_screens/empty_screen.dart';
import 'package:kartdaddy/shimmer/grid_shimmer.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});

  final SearchScreenController _searchScreenController = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(
          text: "Shop Now",
        ),
        elevation: 5,
      ),
      body: Obx(
        () => _searchScreenController.searchProductLoading.value == true
            ? const GridShimmer()
            : _searchScreenController.searchedProduct.isEmpty
                ? const EmptyScreen(
                    title: 'Product Coming Soon',
                  )
                : Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (_searchScreenController.page.value > 1) {
                                    _searchScreenController.page.value -= 1;
                                    _searchScreenController
                                        .searchProductWithCategory();
                                  }
                                },
                                icon: CustomIcons.chevronLeft()),
                            NormalText(
                                text: _searchScreenController.page.value
                                    .toString()),
                            IconButton(
                                onPressed: () {
                                  if (_searchScreenController.page.value <
                                      _searchScreenController.count.value /
                                          20) {
                                    _searchScreenController.page.value += 1;
                                    _searchScreenController
                                        .searchProductWithCategory();
                                  }
                                },
                                icon: CustomIcons.chevronRight())
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          
                          itemCount:
                              _searchScreenController.searchedProduct.length,
                          itemBuilder: (context, index) {
                            ShopApiModel data =
                                _searchScreenController.searchedProduct[index];
                            return Container(
                              margin: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: () {

                                  Get.toNamed(
                                      '/productDetails?slug=${data.slug}&timestamp=${data.timestamp}');
                                },
                                child: BoxBorderContainer(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CachedNetworkImage(
                                              imageUrl: data.thumbImage ??
                                                  'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg',
                                              placeholder: (context, url) =>
                                                  const CustomCircularProgress(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: NormalText(
                                                  text: data.subCategoryName ??
                                                      'null',
                                                  color: CustomColors.blueColor
                                                      .toColor(),
                                                ),
                                              ),
                                              const Gap(8),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: SubHeading(
                                                  text: data.title ?? 'null',
                                                  maxLines: 2,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              
                                              
                                              const Gap(20),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: SubHeading(
                                                    text: AppLocalizations.of(
                                                            context)!
                                                        .rupee(data.buyPrice ??
                                                            '0')),
                                              ),
                                              const Gap(12),
                                              CustomButton(
                                                  onPressed: () {
                                                    // _cartController.addToCart(cartitem: cartitem)
                                                  },
                                                  padding: EdgeInsets.all(8),
                                                  size: Size.fromWidth(
                                                      Get.size.width * .4),
                                                  child: NormalText(
                                                    text: "Add to cart",
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
