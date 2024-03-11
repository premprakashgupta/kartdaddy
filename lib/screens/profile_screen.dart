import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/screens/address_screen.dart';
import 'package:kartdaddy/screens/auth/login_screen.dart';
import 'package:kartdaddy/screens/edit_profile_screen.dart';
import 'package:kartdaddy/screens/language_screen.dart';

import '../components/normal_text_widget.dart';
import '../controllers/auth/login_controller.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final LoginController _loginController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NormalText(text: 'Profile'),
      ),
      body: Obx(
        () => _loginController.loading.value == true
            ? const Center(child: CircularProgressIndicator())
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
}
