import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/footer_widget.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/newsletter_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/components/trending_widget.dart';
import 'package:kartdaddy/components/underline_container.dart';
import 'package:kartdaddy/controllers/cartController.dart';
import 'package:kartdaddy/controllers/website_info_controller.dart';
import 'package:kartdaddy/controllers/wishlist_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/controllers/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kartdaddy/models/banner_model.dart';
import 'package:kartdaddy/models/product_model.dart';
import 'package:kartdaddy/models/section_model.dart';

import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/screens/cart_screen.dart';
import 'package:kartdaddy/screens/profile_screen.dart';
import 'package:kartdaddy/screens/search_screen.dart';
import 'package:kartdaddy/screens/products_list_screen.dart';
import 'package:kartdaddy/screens/shop_api_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';

import '../components/box_border_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController _homeController = Get.put(HomeController());
  final CartController _cartController = Get.put(CartController());
  final WishListController _wishListController = Get.put(WishListController());
  final WebsiteInfoController _websiteInfoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => _websiteInfoController.loading.value == true
                ? CustomCircularProgress()
                  : SvgPicture.network(
                      width: 110,
                      key: Key("webiste header logo"),
                      "https://kartdaddy.in/${_websiteInfoController.websiteInfo.value!.headerLogo}",
                    ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => SearchScreen());
              },
              child: CustomIcons.search(),
            ),
            const Gap(10),
            IconButton(
              onPressed: () {
                Get.to(() => ProfileScreen());
              },
              icon: CustomIcons.person(),
            ),
            const Gap(10),
            InkWell(
              onTap: () {
                Get.to(() => CartScreen());
              },
              child: badges.Badge(
                showBadge: true,
                badgeStyle: badges.BadgeStyle(
                    badgeColor: CustomColors.themeColor.toColor()),
                badgeContent: Obx(() => Text(
                      _cartController.cart.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
                child: CustomIcons.cart(),
              ),
            ),
            const Gap(10)
          ]),
      body: SingleChildScrollView(
          child: Obx(
        () => _homeController.loading.value == true
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomCircularProgress(),
              )
            : Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                    items: _homeController.bannerData.map((mapItem) {
                      BannerModel bannerData = mapItem;
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: CustomColors.sliderColor.toColor(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        NormalText(
                                          text: bannerData.banner_title,
                                          size: Get.size.width * .08,
                                        ),
                                        Heading(
                                            size: Get.size.width * .03,
                                            maxLines: 2,
                                            text:
                                                bannerData.banner_description),
                                      ],
                                    ),
                                    CachedNetworkImage(
                                      height: Get.size.height * .25,
                                      imageUrl:
                                          "https://kartdaddy.in/marketing/banner/${bannerData.first_image}",
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CustomCircularProgress(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomSlider(),
                        const Gap(20),

                        Column(
                          // section part
                          //
                          //
                          //

                          children: List.generate(
                              _homeController.sections.length, (index) {
                            SectionModel section =
                                _homeController.sections[index];
                            // if attribute limitForApp is 0 (section['limitForApp'] < 1) or if there is not product in products array (section['products'].length < 1) the it will not display the category
                            return section.limitForApp < 1 ||
                                    section.products.isEmpty
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      const Gap(20),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: UnderlineContainer(
                                              color: CustomColors.themeColor
                                                  .toColor(),
                                              child:
                                                  Heading(text: section.title)),
                                        ),
                                      ),
                                      const Gap(20),
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            section.products.length >=
                                                    section.limitForApp
                                                ? section.limitForApp
                                                : section.products.length,
                                            (idx) {
                                          ProductModel product =
                                              section.products[idx];
                                          return InkWell(
                                            onTap: () {
                                              // Get.to(() => ProductDetailsScreen(
                                              //       slug: product.slug!,
                                              //       timestamp:
                                              //           product.timestamp!,
                                              //     ));

                                              Get.toNamed(
                                                  '/productDetails?slug=${product.slug!}&timestamp=${product.timestamp!}');
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(8),
                                              width: Get.size.width / 2 - 30,
                                              height: 300,
                                              child: BoxBorderContainer(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: NormalText(
                                                          text: product
                                                              .category_name!,
                                                          color: Colors
                                                              .blue.shade300,
                                                        )),
                                                    const Gap(3),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: SubHeading(
                                                        text: product.title!,
                                                        maxLines: 2,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const Gap(5),
                                                    CachedNetworkImage(
                                                      height: 120,
                                                      imageUrl:
                                                          "https://kartdaddy.in/products/product/${product.thumb_image}",
                                                      placeholder: (context,
                                                              url) =>
                                                          const CustomCircularProgress(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                    const Gap(5),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: NormalText(
                                                            text:
                                                                "${product.discount_type_amount} % off")),
                                                    const Gap(3),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: SubHeading(
                                                            text: AppLocalizations
                                                                    .of(
                                                                        context)!
                                                                .rupee(product
                                                                    .net_sale_amount
                                                                    .toString()))),
                                                    const Gap(3),
                                                  ],
                                                ),
                                              )),
                                            ),
                                          );
                                        }),
                                      ),
                                      const Gap(20),
                                      CustomButton(
                                        onPressed: () {
                                          Get.to(() => ProductsListScreen(
                                                slug: section.slug,
                                                title: section.title,
                                              ));
                                        },
                                        child: const Text(
                                          "View All",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                          }),
                        ),

                        const Gap(30),
                        // Banner
                        //
                        //
                        //
                        Card(
                          child: Container(
                            height: 200,
                            width: 350,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Image.network(
                                      "https://kartdaddy.in/assets/img/246X176/img1.jpg",
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                    return IconButton(
                                      icon: const Icon(Icons.refresh),
                                      onPressed: () {
                                        // Handle refresh action when image fails to load
                                      },
                                    );
                                  }),
                                ),
                                const Flexible(
                                    child: NormalText(
                                  text: "CATCH HOTTEST DEAL IN CAMERA CATEGORY",
                                  size: 20,
                                  maxLines: 4,
                                ))
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Card(
                          child: Container(
                            height: 200,
                            width: 350,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Image.network(
                                      "https://kartdaddy.in/assets/img/246X176/img1.jpg",
                                      height: 200, errorBuilder:
                                          (BuildContext context, Object error,
                                              StackTrace? stackTrace) {
                                    return IconButton(
                                      icon: const Icon(Icons.refresh),
                                      onPressed: () {
                                        // Handle refresh action when image fails to load
                                      },
                                    );
                                  }),
                                ),
                                const Flexible(
                                    child: NormalText(
                                  text: "CATCH HOTTEST DEAL IN CAMERA CATEGORY",
                                  size: 20,
                                  maxLines: 4,
                                ))
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Card(
                          child: Container(
                            height: 200,
                            width: 350,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Image.network(
                                      "https://kartdaddy.in/assets/img/246X176/img1.jpg",
                                      errorBuilder: (BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace) {
                                    return IconButton(
                                      icon: const Icon(Icons.refresh),
                                      onPressed: () {
                                        // Handle refresh action when image fails to load
                                      },
                                    );
                                  }),
                                ),
                                const Flexible(
                                    child: NormalText(
                                  text: "CATCH HOTTEST DEAL IN CAMERA CATEGORY",
                                  size: 20,
                                  maxLines: 4,
                                ))
                              ],
                            ),
                          ),
                        ),
                        // *
                        // *
                        // *
                        // horizontal scrollbar - popular product
                        const Gap(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UnderlineContainer(
                                child: Heading(
                              text: AppLocalizations.of(context)!
                                  .popular_products,
                            )),
                          ],
                        ),

                        const Gap(20),
                        Card(
                          child: Container(
                            height: 200,
                            width: 350,
                            padding: const EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    NormalText(
                                      text:
                                          "CATCH HOTTEST DEAL IN CAMERA CATEGORY",
                                      size: 20,
                                      maxLines: 4,
                                    ),
                                    NormalText(
                                      text: "just for Today",
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 30,
                                  child: CustomButton(
                                      child: const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          NormalText(
                                            text: "\$",
                                            size: 15,
                                          ),
                                          Heading(
                                            text: "99",
                                          ),
                                          SubHeading(
                                            text: "99",
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // *
                        // *
                        // *
                        // New products - scrollbar
                        const Gap(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UnderlineContainer(
                                child: Heading(
                              text: AppLocalizations.of(context)!.new_products,
                            )),
                          ],
                        ),

                        // *
                        // *
                        // *
                        // Known products
                        const Gap(40),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: UnderlineContainer(
                            child: Heading(
                              text:
                                  AppLocalizations.of(context)!.known_products,
                            ),
                          ),
                        ),
                        const Gap(40),
                        // *
                        // *
                        // *
                        // Advertisement card
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          height: 250,
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.network(
                                              "https://electro.madrasthemes.com/wp-content/uploads/2021/11/brand-1.png",
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                            return IconButton(
                                              icon: const Icon(Icons.refresh),
                                              onPressed: () {
                                                // Handle refresh action when image fails to load
                                              },
                                            );
                                          }),
                                        ),
                                        const NormalText(
                                            text:
                                                "Brings you the best in music, plus all things culture, style, and sports",
                                            size: 20,
                                            maxLines: 4)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: -50,
                                  right: -20,
                                  child: Image.network(
                                    "https://electro.madrasthemes.com/wp-content/uploads/2021/11/image-6-1.png",
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      return IconButton(
                                        icon: const Icon(Icons.refresh),
                                        onPressed: () {
                                          // Handle refresh action when image fails to load
                                        },
                                      );
                                    },
                                    height: 180,
                                  ))
                            ],
                          ),
                        ),

                        const Gap(20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          height: 250,
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.network(
                                              "https://electro.madrasthemes.com/wp-content/uploads/2021/11/brand-1.png",
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                            return IconButton(
                                              icon: const Icon(Icons.refresh),
                                              onPressed: () {
                                                // Handle refresh action when image fails to load
                                              },
                                            );
                                          }),
                                        ),
                                        const NormalText(
                                            text:
                                                "Brings you the best in music, plus all things culture, style, and sports",
                                            size: 20,
                                            maxLines: 4)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: -50,
                                  right: -20,
                                  child: Image.network(
                                    "https://electro.madrasthemes.com/wp-content/uploads/2021/11/image-6-1.png",
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      return IconButton(
                                        icon: const Icon(Icons.refresh),
                                        onPressed: () {
                                          // Handle refresh action when image fails to load
                                        },
                                      );
                                    },
                                    height: 180,
                                  ))
                            ],
                          ),
                        ),
                        const Gap(40),
                        const NewsLetterWidget()
                      ],
                    ),
                  ),
                  const Gap(30),
                  FooterWidget()
                ],
              ),
      )),
      drawer: Obx(() => Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Gap(Get.size.height * .1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _websiteInfoController.loading.value == true
                        ? CustomCircularProgress()
                        : SvgPicture.network(
                            key: Key("webiste header logo"),
                            "https://kartdaddy.in/${_websiteInfoController.websiteInfo.value!.headerLogo}",
                          ),
                  ),
                ),
                Gap(20),
                ..._websiteInfoController.categoryList.map((masterCat) {
                  return ExpansionTile(
                    title: Text(masterCat['name']),
                    childrenPadding: EdgeInsets.only(left: 20),
                    children: masterCat['categories'].map<Widget>((category) {
                      return ExpansionTile(
                        title: Text(category['name']),
                        childrenPadding: EdgeInsets.only(left: 40),
                        children: category['sub_categories']
                            .map<Widget>((subCategory) {
                          return ListTile(
                            title: Text(subCategory['name']),
                            onTap: () {
                              Get.to(() => ShopApiScreen(
                                    slug: subCategory['slug'],
                                    title: subCategory['name'],
                                  ));
                            },
                          );
                        }).toList(),
                      );
                    }).toList(),
                  );
                }).toList(),
                const SizedBox(height: 30),
                Stack(
                  children: [
                    SvgPicture.asset('assets/drawer_bg.svg',
                        height: 120, semanticsLabel: 'Acme Logo'),
                    const SizedBox(height: 8),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle privacy button tap
                            },
                            child: const Text('Privacy'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle terms button tap
                            },
                            child: const Text('Terms'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
