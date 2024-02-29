import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/screens/address_screen.dart';
import 'package:kartdaddy/screens/edit_profile_screen.dart';
import 'package:kartdaddy/screens/language_screen.dart';

import '../components/normal_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NormalText(text: 'Profile'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  // Add your avatar image here
                  // backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                Gap(10.0),
                Heading(
                  text: 'Username',
                ),
                NormalText(text: 'Email@example.com', size: 16.0),
                NormalText(text: 'Mobile: +1234567890', size: 16.0),
              ],
            ),
          ),
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
              Get.to(() => AddressScreen());
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
              // Implement sign out functionality
            },
          ),
          TextButton(
              onPressed: () {},
              child: const NormalText(
                text: "Terms and Conditions",
              ))
        ],
      ),
    );
  }
}
