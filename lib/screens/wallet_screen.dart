import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:kartdaddy/designs/custom_icons.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Heading(
          text: 'Wallet',
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CustomIcons.rupee(),
            title: const NormalText(
              text: 'Wallet Amount',
            ),
            trailing: NormalText(
              text: _loginController.user!.wallet_amount.toString(),
            ),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
