import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/thank_you_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Payment Method'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
                Get.off(() => ThankYouScreen());
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
