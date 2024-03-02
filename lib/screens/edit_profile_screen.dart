
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final _profileData = {
    'username': 'John Doe',
    'email': 'johndoe@email.com',
    'profilePicture': 'https://kartdaddy.in/assets/img/400X400/img1.png',
  };
  XFile? _image;

  @override
  void initState() {
    super.initState();
    // Load pre-filled data from _profileData
    _usernameController.text = _profileData['username'] ?? '';
    _emailController.text = _profileData['email'] ?? '';
    _mobileController.text = _profileData['mobile'] ?? '';
  }

  // Function to open the gallery and pick an image
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        // You can handle the logic to upload the image to your server or save it locally.
      }
    });
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
            // CircularAvatar with edit icon
            InkWell(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: 
                           NetworkImage('https://kartdaddy.in/assets/img/400X400/img1.png'),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width*.3,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap( 16),
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
