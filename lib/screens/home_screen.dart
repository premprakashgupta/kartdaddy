import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/box_shadow_container.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/footer_widget.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/newsletter_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/components/trending_widget.dart';
import 'package:kartdaddy/components/underline_container.dart';
import 'package:kartdaddy/data/demo_data.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/controllers/home_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/screens/cart_screen.dart';
import 'package:kartdaddy/screens/new_products_screen.dart';
import 'package:kartdaddy/screens/popular_products_screen.dart';
import 'package:kartdaddy/screens/product_screen.dart';
import 'package:kartdaddy/screens/profile_screen.dart';
import 'package:kartdaddy/screens/search_screen.dart';
import 'package:kartdaddy/screens/section_products_screen.dart';

import '../components/box_border_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/kartdaddy-logo.png"),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => const SearchScreen());
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
                Get.to(() => const CartScreen());
              },
              child: badges.Badge(
                showBadge: true,
                badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.red),
                ),
                child: CustomIcons.cart(),
              ),
            ),
            const Gap(10)
          ]),
      body: SingleChildScrollView(
          child: Obx(
        () => _homeController.loading.value == true
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300.0,
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                    items: DemoData.slideImage.map((img) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: CustomColors.slideColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        NormalText(
                                          text: 'LIMITED',
                                          size: 34,
                                        ),
                                        SubHeading(
                                          text: 'WEEK DEAL',
                                          size: 34,
                                        ),
                                        Heading(
                                            text:
                                                'Hurry Up\nBefore Offer\nwill End'),
                                      ],
                                    ),
                                    Image.network(img, height: 150,
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                      return IconButton(
                                        icon: Icon(Icons.refresh),
                                        onPressed: () {
                                          // Handle refresh action when image fails to load
                                        },
                                      );
                                    })
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
                          children: List.generate(
                              _homeController.sections.length, (index) {
                            var section = _homeController.sections[index];
                            return Column(
                              children: [
                                const Gap(20),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: UnderlineContainer(
                                        color: Colors.amber,
                                        child: Heading(text: section['title'])),
                                  ),
                                ),
                                const Gap(20),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(
                                      section['products'].length >=
                                              section['count']
                                          ? section['count']
                                          : section['products'].length, (idx) {
                                    var product = section['products'][idx];
                                    return Container(
                                      margin: const EdgeInsets.all(8),
                                      width: Get.size.width / 2 - 30,
                                      height: 340,
                                      child: BoxBorderContainer(
                                          child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: NormalText(
                                                  text:
                                                      product['category_name'],
                                                  color: Colors.blue.shade300,
                                                )),
                                            const Gap(8),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: SubHeading(
                                                text: product['title'],
                                                maxLines: 2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Gap(20),
                                            CachedNetworkImage(
                                              imageUrl:
                                                  "https://kartdaddy.in/products/product/${product['thumb_image']}",
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            Gap(20),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: SubHeading(
                                                    text:
                                                        product['sale_price'])),
                                            const Gap(6),
                                          ],
                                        ),
                                      )),
                                    );
                                  }),
                                ),
                                const Gap(20),
                                CustomButton(
                                  onPressed: () {
                                    Get.to(() => SectionProductsScreen(
                                          slug: section['slug'],
                                          title: section['title'],
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
                                      icon: Icon(Icons.refresh),
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
                                      icon: Icon(Icons.refresh),
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
                                      icon: Icon(Icons.refresh),
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
                            TextButton(
                                onPressed: () {
                                  Get.to(() => PopularProductsScreen());
                                },
                                child: const NormalText(
                                  text: "View All",
                                  size: 20,
                                ))
                          ],
                        ),
                        const Gap(40),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              DemoData.slideImage.length,
                              (index) => InkWell(
                                onTap: () {
                                  Get.to(() => ProductScreen(
                                        productData:
                                            DemoData.demoProductData[0],
                                      ));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  width: 180,
                                  child: BoxBorderContainer(
                                      child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child:
                                                NormalText(text: "7 Products")),
                                        const Gap(8),
                                        const Heading(
                                          text: "Mobile Phone Accesaries",
                                          maxLines: 2,
                                        ),
                                        Gap(20),
                                        Image.network(
                                          height: 100,
                                          errorBuilder: (BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace) {
                                            return IconButton(
                                              icon: Icon(Icons.refresh),
                                              onPressed: () {
                                                // Handle refresh action when image fails to load
                                              },
                                            );
                                          },
                                          DemoData.slideImage[index],
                                          fit: BoxFit.cover,
                                        ),
                                        Gap(20),
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child: SubHeading(text: "11000")),
                                        const Gap(6),
                                      ],
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ),
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
                            TextButton(
                                onPressed: () {
                                  Get.to(() => NewProductsScreen());
                                },
                                child: const NormalText(
                                  text: "View All",
                                  size: 20,
                                ))
                          ],
                        ),
                        const Gap(40),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              DemoData.slideImage.length,
                              (index) => Container(
                                margin: const EdgeInsets.all(8),
                                width: 180,
                                child: BoxBorderContainer(
                                    child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      const Align(
                                          alignment: Alignment.centerLeft,
                                          child:
                                              NormalText(text: "7 Products")),
                                      const Gap(8),
                                      const Heading(
                                        text: "Mobile Phone Accesaries",
                                        maxLines: 2,
                                      ),
                                      Gap(20),
                                      Image.network(
                                        height: 100,
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          return IconButton(
                                            icon: Icon(Icons.refresh),
                                            onPressed: () {
                                              // Handle refresh action when image fails to load
                                            },
                                          );
                                        },
                                        DemoData.slideImage[index],
                                        fit: BoxFit.cover,
                                      ),
                                      Gap(20),
                                      const Align(
                                          alignment: Alignment.centerLeft,
                                          child: SubHeading(text: "11000")),
                                      const Gap(6),
                                    ],
                                  ),
                                )),
                              ),
                            ),
                          ),
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
                                              icon: Icon(Icons.refresh),
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
                                        icon: Icon(Icons.refresh),
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
                                              icon: Icon(Icons.refresh),
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
                                        icon: Icon(Icons.refresh),
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
                  const FooterWidget()
                ],
              ),
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/kartdaddy-logo.png"),
              ),
              accountName: const Text("prem prakash gupta"),
              accountEmail: const Text("prem.com0011@gmail.com"),
            ),
            ListTile(
              title: const Text('Mobile & Mobile Accessories'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: const Text('Laptop & Computer'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text('CCTV & Security System'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            ListTile(
              title: const Text('Kitchen Appliances'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            ListTile(
              title: const Text('Personal Care'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            ListTile(
              title: const Text('Watches'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            ListTile(
              title: const Text('Men\'s Accessories'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            ListTile(
              title: const Text('Inverter And Batteries'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            ListTile(
              title: const Text('Home Appliances'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            ListTile(
              title: const Text('Electricals'),
              trailing: CustomIcons.chevronRight(size: 18),
              onTap: () {
                // Handle item 11 tap
              },
            ),
            const Gap(30),
            Stack(
              children: [
                SvgPicture.asset('assets/drawer_bg.svg',
                    height: 120, semanticsLabel: 'Acme Logo'),
                const Gap(8),
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
      ),
    );
  }
}
