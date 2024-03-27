import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/screens/bottom_navigation_screen.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank You'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank you for your order!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomButton(
              size: Size.fromWidth(Get.size.width * .4),
              onPressed: () {
                Get.offAll(() => const BottomNavigationScreen());
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
