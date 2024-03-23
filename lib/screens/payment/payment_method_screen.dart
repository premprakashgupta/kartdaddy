import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/payment/thank_you_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                // Navigate to online payment screen
                // Add your navigation logic here
              },
              leading: CustomIcons.creditCard(),
              title: Text(AppLocalizations.of(context)!.pay_online),
              trailing: CustomIcons.chevronRight(),
            ),
            ListTile(
              onTap: () {
                Get.off(() => const ThankYouScreen());
              },
              leading: CustomIcons.rupee(),
              title: Text(AppLocalizations.of(context)!.cash_on_delivery),
              trailing: CustomIcons.chevronRight(),
            ),
          ],
        ),
      ),
    );
  }
}
