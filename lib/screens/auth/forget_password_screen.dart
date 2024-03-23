
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/auth/forget_password_controller.dart';
import 'package:kartdaddy/screens/auth/otp_verification_screen.dart';

import '../../components/normal_text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final ForgetPasswordController _forgetPasswordController =
      Get.put(ForgetPasswordController());
  final TextEditingController _identifierController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int otp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                const SubHeading(
                  text: "Forget Password",
                  color: Colors.black,
                ),
                const Gap(20),
                const NormalText(
                  text:
                      "If your email or mobile is available in database then you will get otp on registered email or mobile",
                  maxLines: 4,
                ),
                const Gap(40),
                TextFormField(
                  controller: _identifierController,
                  decoration: const InputDecoration(
                    labelText: 'Email/Mobile',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email or mobile';
                    }
                    // You can add more email validation logic here if needed
                    return null;
                  },
                ),
                const Gap(20),
                CustomButton(
                  size: Size.fromWidth(MediaQuery.of(context).size.width),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, proceed with sending OTP
                      _forgetPasswordController.sendOtp(
                          identifier: _identifierController.text);
                      Get.to(
                        () => OTPVerificationScreen(
                          forgetPass: true,
                        ),
                      );
                    }
                  },
                  child: const NormalText(text: 'Send OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
