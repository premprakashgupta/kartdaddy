import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/controllers/auth/forget_password_controller.dart';
import 'package:kartdaddy/screens/home_screen.dart';

import '../../components/normal_text_widget.dart';
import '../../components/subheading_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ForgetPasswordController _forgetPasswordController =
      Get.put(ForgetPasswordController());
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NormalText(text: 'Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubHeading(
                text: "Reset Your Password",
                color: Colors.black,
              ),
              const Gap(20),
              const NormalText(
                text:
                    "please fill new password and same password in confirm password",
                maxLines: 4,
              ),
              const Gap(40),
              TextFormField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  }
                  // Add more password validation logic if needed
                  return null;
                },
              ),
              const Gap(8),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const Gap(16),
              CustomButton(
                size: Size.fromWidth(MediaQuery.of(context).size.width),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, proceed with saving new password
                    _forgetPasswordController.resetPassword(
                        password: newPasswordController.text,
                        password_confirmation: confirmPasswordController.text);
                  }
                },
                child: const NormalText(text: 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
