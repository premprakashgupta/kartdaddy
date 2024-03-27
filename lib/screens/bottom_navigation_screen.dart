import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/controllers/cartController.dart';
import 'package:kartdaddy/controllers/search_controller.dart';
import 'package:kartdaddy/controllers/wishlist_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/cart/cart_screen.dart';
import 'package:kartdaddy/screens/home_screen.dart';
import 'package:kartdaddy/screens/profile/profile_screen.dart';
import 'package:kartdaddy/screens/search/search_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:badges/badges.dart' as badges;

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final CartController _cartController = Get.put(CartController());
  final WishListController _temp = Get.put(WishListController());
  final SearchScreenController _searchScreenController = Get.find();
  int stackIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ProfileScreen(),
    SearchScreen(),
    CartScreen()
  ];
  List<int> visitedIndexes = [0]; // Keep track of visited indexes
  bool wantBack = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: wantBack,
      onPopInvoked: (bool didPop) async {
        print(didPop);
        if (didPop) return;
        if (visitedIndexes.length > 1) {
          setState(() {
            visitedIndexes.removeLast(); // Remove current index
            stackIndex = visitedIndexes.last; // Go back to previous index
          });
          return;
        } else {
          setState(() {
            wantBack = true;
          });
          Get.back();
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: stackIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: stackIndex,
          selectedItemColor: CustomColors.themeColor.toColor(),
          unselectedItemColor: CustomColors.blackColor.toColor(),
          elevation: 5,
          onTap: (int index) {
            setState(() {
              if (!visitedIndexes.contains(index)) {
                visitedIndexes.add(index); // Add index to visited indexes list
              }
              stackIndex = index;
              if (index != 2) {
                _searchScreenController.searchController.clear();
                _searchScreenController.filteredProducts.clear();
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: CustomIcons.homeOutline(),
                activeIcon:
                    CustomIcons.home(color: CustomColors.themeColor.toColor()),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: CustomIcons.personOutline(),
                activeIcon: CustomIcons.person(
                    color: CustomColors.themeColor.toColor()),
                label: 'Profile'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: badges.Badge(
                  showBadge: true,
                  badgeStyle: badges.BadgeStyle(
                      badgeColor: CustomColors.themeColor.toColor()),
                  badgeContent: Obx(() => Text(
                        _cartController.cart.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      )),
                  child: CustomIcons.cartOutline(),
                ),
                activeIcon:
                    CustomIcons.cart(color: CustomColors.themeColor.toColor()),
                label: 'Cart'),
          ],
        ),
      ),
    );
  }
}
