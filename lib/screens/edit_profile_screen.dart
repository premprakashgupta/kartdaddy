
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final LoginController _loginController = Get.find();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final _profileData = {
    'username': 'John Doe',
    'email': 'johndoe@email.com',
    'profilePicture': 'https://kartdaddy.in/assets/img/400X400/img1.png',
  };
  

  @override
  void initState() {
    super.initState();
    // Load pre-filled data from _profileData
    _usernameController.text = _loginController.user!.name ?? '';
    _emailController.text = _loginController.user!.email ?? '';
    _mobileController.text = _loginController.user!.mobile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            // Text fields for other profile information
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const Gap( 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const Gap( 16),
            TextField(
              controller: _mobileController,
              decoration: const InputDecoration(labelText: 'Mobile'),
              readOnly: true,
            ),
            const Gap( 36),
            // Update profile button
            CustomButton(
              onPressed: () {
                // Handle the profile update logic here

                // Show a success snackbar
                Get.snackbar(
                  'Profile Updated',
                  'Your profile has been updated successfully!',
                );
              },
              child: const NormalText(text:'Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
