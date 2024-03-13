import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/screens/address_screen.dart';
import 'package:kartdaddy/screens/auth/login_screen.dart';
import 'package:kartdaddy/screens/edit_profile_screen.dart';
import 'package:kartdaddy/screens/language_screen.dart';
import 'package:kartdaddy/screens/wish_list_screen.dart';

import '../components/normal_text_widget.dart';
import '../controllers/auth/login_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LoginController _loginController = Get.find();

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
                                _buildCapsulBox(text: "Your Orders"),
                                _buildCapsulBox(text: "Buy Again"),
                                _buildCapsulBox(text: "Your Account"),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => WishListScreen());
                                  },
                                  child: _buildCapsulBox(text: "Your Lists"),
                                )
                               
                              ],
                            ),
                          ),
                          const Gap(20),
                          const SubHeading(
                            text: "Your Orders",
                            color: Colors.black,
                          )
                        ],
                      )),
                  ListTile(
                    title: const NormalText(text: 'Edit Profile'),
                    onTap: () {
                      Get.to(() => const EditProfileScreen());
                    },
                  ),
                  ListTile(
                    title: const NormalText(text: 'Wallet'),
                    onTap: () {
                      // Navigate to wallet screen
                    },
                  ),
                  ListTile(
                    title: const NormalText(text: 'Manage Address'),
                    onTap: () {
                      Get.to(() => const AddressScreen());
                    },
                  ),
                  ListTile(
                    title: const NormalText(text: 'Language'),
                    onTap: () {
                      Get.to(() => const LanguageScreen());
                    },
                  ),
                  ListTile(
                    title: const NormalText(text: 'Settings'),
                    onTap: () {
                      // Navigate to settings screen
                    },
                  ),
                  ListTile(
                    title: const NormalText(text: 'Privacy'),
                    onTap: () {
                      // Navigate to privacy settings screen
                    },
                  ),
                  ListTile(
                    title: const NormalText(text: 'Sign Out'),
                    onTap: () {
                      _loginController.logoutUser();
                      _loginController.loading.value = false;

                      Get.offAll(() => const LoginScreen());
                    },
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const NormalText(
                        text: "Terms and Conditions",
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
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white),
      child: NormalText(text: text),
    );
  }
}
