import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/landing_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/address/address_screen.dart';
import 'package:kartdaddy/screens/profile/edit_profile_screen.dart';
import 'package:kartdaddy/screens/landing_screen.dart';
import 'package:kartdaddy/screens/language_screen.dart';
import 'package:kartdaddy/screens/setting/setting_screen.dart';
import 'package:kartdaddy/screens/wallet_screen.dart';
import 'package:kartdaddy/screens/product/wish_list_screen.dart';
import 'package:kartdaddy/screens/cart/your_orders_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/normal_text_widget.dart';
import '../../controllers/auth/login_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LoginController _loginController = Get.find();
  final LandingController _landingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(text: 'Profile'),
      ),
      body: Obx(
        () => _loginController.loading.value == true
            ? const CustomCircularProgress()
            : ListView(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Heading(
                            text: _loginController.user!.name,
                          ),
                          NormalText(
                              text: _loginController.user!.email, size: 16.0),
                          const Gap(20),
                          Center(
                            child: Wrap(
                              spacing: 15,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 15,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => YourOrdersScreen());
                                  },
                                  child: _buildCapsulBox(
                                      text: AppLocalizations.of(context)!
                                          .your_orders),
                                ),
                                _buildCapsulBox(
                                    text: AppLocalizations.of(context)!
                                        .buy_again),
                                _buildCapsulBox(
                                    text: AppLocalizations.of(context)!
                                        .your_account),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => WishListScreen());
                                  },
                                  child: _buildCapsulBox(
                                      text: AppLocalizations.of(context)!
                                          .your_lists),
                                )
                              ],
                            ),
                          ),
                          const Gap(20),
                          SubHeading(
                            text: AppLocalizations.of(context)!.your_orders,
                            color: Colors.black,
                          )
                        ],
                      )),
                  ListTile(
                    title: NormalText(
                        text: AppLocalizations.of(context)!.edit_profile),
                    onTap: () {
                      Get.to(() => EditProfileScreen());
                    },
                    trailing: CustomIcons.chevronRight(),
                  ),
                  ListTile(
                    title:
                        NormalText(text: AppLocalizations.of(context)!.wallet),
                    trailing: CustomIcons.chevronRight(),
                    onTap: () {
                      Get.to(() => WalletScreen());
                    },
                  ),
                  ListTile(
                    title: NormalText(
                        text: AppLocalizations.of(context)!.manage_address),
                    onTap: () {
                      Get.to(() => AddressScreen(
                            throughOrder: false,
                          ));
                    },
                    trailing: CustomIcons.chevronRight(),
                  ),
                  ListTile(
                    title: NormalText(
                        text: AppLocalizations.of(context)!.language),
                    onTap: () {
                      Get.to(() => const LanguageScreen());
                    },
                    trailing: CustomIcons.chevronRight(),
                  ),
                  ListTile(
                    title:
                        NormalText(text: AppLocalizations.of(context)!.setting),
                    onTap: () {
                      Get.to(() => const SettingScreen());
                    },
                    trailing: CustomIcons.chevronRight(),
                  ),
                  ListTile(
                    title:
                        NormalText(text: AppLocalizations.of(context)!.privacy),
                    onTap: () {
                      // Navigate to privacy settings screen
                    },
                  ),
                  ListTile(
                    title: NormalText(
                      text: AppLocalizations.of(context)!.sign_out,
                      color: CustomColors.redColor.toColor(),
                    ),
                    onTap: () {
                      _loginController.logoutUser();
                      _loginController.loading.value = true;
                      _landingController.loggedIn.value = false;
                      Get.offAll(() => LandingScreen());
                    },
                  ),
                  TextButton(
                      onPressed: () {},
                      child: NormalText(
                        text: AppLocalizations.of(context)!.term_and_condition,
                      ))
                ],
              ),
      ),
    );
  }

  Widget _buildCapsulBox({required String text}) {
    return Container(
      width: Get.size.width * .5 - 40,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border:
              Border.all(color: CustomColors.borderColor.toColor(), width: 1),
          color: Colors.white),
      child: NormalText(text: text),
    );
  }
}
