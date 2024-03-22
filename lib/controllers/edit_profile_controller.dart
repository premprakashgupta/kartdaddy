import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/api/auth.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:kartdaddy/utility/custom_snackbar.dart';

class EditProfileController extends GetxController {
  var box = GetStorage();
  final isNotEmailEditable = true.obs;
  final isNotMobileEditable = true.obs;
  final isNotNameEditable = true.obs;
  String _token = '';

  final LoginController loginController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  late FocusNode emailFocusNode = FocusNode();
  late FocusNode mobileFocusNode = FocusNode();
  late FocusNode nameFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    _token = box.read('token');
    // Load pre-filled data from _profileData
    nameController.text = loginController.user!.name ?? '';
    emailController.text = loginController.user!.email ?? '';
    mobileController.text = loginController.user!.mobile ?? '';
  }

  void updateName() async {
    try {
      String url = AuthApi.updateName;
      var unique_secret = box.read('unique_secret');
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'otp': otpController.text, 'unique_secret': unique_secret});

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;

        box.remove('unique_secret');
        CustomSnackbar.showSnackbar(
            title: 'Profile Edit', message: jsonData['message']);

        otpController.clear();
        isNotNameEditable.value = true;
        loginController.setName(nameController.text);
      }
    } catch (e) {
      print(e);
    }
  }

  void editName() async {
    try {
      String url = AuthApi.editName;
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'name': nameController.text});

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(jsonData['data']);
        box.write('unique_secret', jsonData['data']['unique_secret']);
        CustomSnackbar.showSnackbar(
            title: 'Profile Edit', message: jsonData['message']);

        Get.dialog(
          AlertDialog(
            title: Heading(text: "OTP Verification"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(text: "Fill correct otp here"),
                ),
                Gap(20),
                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "OTP",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("CLOSE"),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                child: Text("UPDATE"),
                onPressed: () {
                  updateName();
                  Get.back();
                },
              )
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void updateEmail() async {
    try {
      String url = AuthApi.updateEmail;
      var unique_secret = box.read('unique_secret');
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'otp': otpController.text, 'unique_secret': unique_secret});

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;

        box.remove('unique_secret');
        CustomSnackbar.showSnackbar(
            title: 'Profile Edit', message: jsonData['message']);

        otpController.clear();
        isNotEmailEditable.value = true;
        loginController.setEmail(emailController.text);
      }
    } catch (e) {
      print(e);
    }
  }

  void editEmail() async {
    try {
      String url = AuthApi.editEmail;
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'email': emailController.text});

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(jsonData['data']);
        box.write('unique_secret', jsonData['data']['unique_secret']);
        CustomSnackbar.showSnackbar(
            title: 'Profile Edit', message: jsonData['message']);

        Get.dialog(
          AlertDialog(
            title: Heading(text: "OTP Verification"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(text: "Fill correct otp here"),
                ),
                Gap(20),
                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "OTP",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("CLOSE"),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                child: Text("UPDATE"),
                onPressed: () {
                  updateEmail();
                  Get.back();
                },
              )
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void updateMobile() async {
    try {
      String url = AuthApi.updateMobile;
      var unique_secret = box.read('unique_secret');
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'otp': otpController.text, 'unique_secret': unique_secret});

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;

        box.remove('unique_secret');
        CustomSnackbar.showSnackbar(
            title: 'Profile Edit', message: jsonData['message']);

        otpController.clear();
        isNotMobileEditable.value = true;
        loginController.setMobile(mobileController.text);
      }
    } catch (e) {
      print(e);
    }
  }

  void editMobile() async {
    try {
      String url = AuthApi.editMobile;
      var response = await http.post(Uri.parse(url),
          headers: {'Authorization': 'Bearer $_token'},
          body: {'mobile': mobileController.text});

      if (response.statusCode == 200) {
        var jsonData = await json.decode(response.body) as Map<String, dynamic>;
        print(jsonData['data']);
        box.write('unique_secret', jsonData['data']['unique_secret']);
        CustomSnackbar.showSnackbar(
            title: 'Profile Edit', message: jsonData['message']);

        Get.dialog(
          AlertDialog(
            title: Heading(text: "OTP Verification"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: NormalText(text: "Fill correct otp here"),
                ),
                TextFormField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "OTP",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("CLOSE"),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                child: Text("UPDATE"),
                onPressed: () {
                  updateMobile();
                  Get.back();
                },
              )
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    otpController.dispose();
    isNotEmailEditable.value = true;
    isNotMobileEditable.value = true;
    isNotNameEditable.value = true;
    emailFocusNode.dispose();
    mobileFocusNode.dispose();
    nameFocusNode.dispose();
    super.onClose();
  }
}
