import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/custom_input.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/update_password_controller.dart';

class UpdatePasswordScreen extends StatelessWidget {
  final UpdatePasswordController _updatePasswordController =
      Get.put(UpdatePasswordController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInput(
                label: const NormalText(
                  text: 'Old Password',
                ),
                controller: _updatePasswordController.oldPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Old password is required';
                  }
                  return null;
                },
                hint: 'Old Password',
              ),
              const SizedBox(height: 20),
              CustomInput(
                label: const NormalText(
                  text: 'New Password',
                ),
                controller: _updatePasswordController.newPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'New password is required';
                  }
                  return null;
                },
                hint: 'New Password',
              ),
              const SizedBox(height: 20),
              CustomInput(
                label: const NormalText(
                  text: 'Confirm New Password',
                ),
                controller: _updatePasswordController.confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirmation password is required';
                  } else if (value !=
                      _updatePasswordController.newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                hint: 'Confirm New Password',
              ),
              const SizedBox(height: 40),
              Obx(() => CustomButton(
                    onPressed: _updatePasswordController.loading.value
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _updatePasswordController.updatePassword();
                            }
                          },
                    child: NormalText(
                        text: _updatePasswordController.loading.value
                            ? 'Updating...'
                            : 'Update'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
