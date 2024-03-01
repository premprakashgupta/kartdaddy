import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/controllers/landing_controller.dart';
import 'package:kartdaddy/screens/auth/login_screen.dart';
import 'package:kartdaddy/screens/home_screen.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  final LandingController _landingController = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => _landingController.loggedIn.value == true
        ? HomeScreen()
        : LoginScreen());
  }
}
