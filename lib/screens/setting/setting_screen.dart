import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/setting/update_password_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(
          text: "Setting",
        ),
      ),
      body: ListTile(
        onTap: () {
          Get.to(() => UpdatePasswordScreen());
        },
        title: const NormalText(
          text: "Update Password",
        ),
        trailing: CustomIcons.chevronRight(),
      ),
    );
  }
}
