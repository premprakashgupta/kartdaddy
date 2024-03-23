import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/auth.dart';

class UpdatePasswordController extends GetxController {
  GetStorage box = GetStorage();
  var _token = '';
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _token = box.read('token');
    super.onInit();
  }

  void updatePassword() async {
    loading.value = true;
    final oldPassword = oldPasswordController.text;
    final newPassword = newPasswordController.text;
    final confPassword = confirmPasswordController.text;

    try {
      // Make an HTTP request to update the password
      // Replace the URL with your actual endpoint
      final response = await http.put(
        Uri.parse(AuthApi.updatePassword),
        headers: {'Authorization': 'Bearer $_token'},
        body: {
          'old_password': oldPassword,
          'password': newPassword,
          "password_confirmation": confPassword
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        // Password updated successfully
        // Show a success message or navigate to another screen
        Get.snackbar('Success', 'Password updated successfully');
      } else {
        // Handle errors
        Get.snackbar('Error', 'Failed to update password');
      }
    } catch (e) {
      // Handle exceptions
      print('Error updating password: $e');
      Get.snackbar('Error', 'An error occurred while updating password');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onClose() {
    // Clean up controllers when the controller is closed
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
