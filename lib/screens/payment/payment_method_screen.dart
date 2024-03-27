
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/payment_controller.dart';
import 'package:kartdaddy/designs/custom_icons.dart';



class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key});

  final PaymentController _paymentController = Get.put(PaymentController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              _paymentController.pay();
            },
            title: NormalText(text: "Online Pay"),
            leading: CustomIcons.creditCard(),
          ),
          ListTile(
            onTap: () {
              _paymentController.makePaymentViaCOD();
            },
            title: NormalText(text: "Cash on delivery"),
            leading: CustomIcons.rupee(),
          )
        ],
      ),
    );
  } 
  

  
}
