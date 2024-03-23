import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:kartdaddy/controllers/edit_profile_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text fields for other profile information
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _editProfileController.nameController,
                      readOnly: _editProfileController.isNotNameEditable.value,
                      focusNode: _editProfileController.nameFocusNode,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                  ),
                  _editProfileController.isNotNameEditable.value == false
                      ? TextButton(
                          onPressed: () {
                            _editProfileController.updateName();
                          },
                          child: SubHeading(
                            text: "Done",
                            color: CustomColors.blueColor.toColor(),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            _editProfileController.isNotNameEditable.value =
                                false;
                            _editProfileController.nameFocusNode.requestFocus();
                          },
                          child: SubHeading(
                            text: "Edit",
                            color: CustomColors.blueColor.toColor(),
                          ))
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _editProfileController.emailController,
                      readOnly: _editProfileController.isNotEmailEditable.value,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: _editProfileController.emailFocusNode,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  _editProfileController.isNotEmailEditable.value == false
                      ? TextButton(
                          onPressed: () {
                            _editProfileController.editEmail();
                          },
                          child: SubHeading(
                            text: "Verify",
                            color: CustomColors.blueColor.toColor(),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            _editProfileController.isNotEmailEditable.value =
                                false;
                            _editProfileController.emailFocusNode
                                .requestFocus();
                          },
                          child: SubHeading(
                            text: "Edit",
                            color: CustomColors.blueColor.toColor(),
                          ))
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _editProfileController.mobileController,
                      readOnly:
                          _editProfileController.isNotMobileEditable.value,
                      keyboardType: TextInputType.number,
                      focusNode: _editProfileController.mobileFocusNode,
                      decoration: const InputDecoration(labelText: 'Mobile'),
                    ),
                  ),
                  _editProfileController.isNotMobileEditable.value == false
                      ? TextButton(
                          onPressed: () {
                            _editProfileController.editMobile();
                          },
                          child: SubHeading(
                            text: "Verify",
                            color: CustomColors.blueColor.toColor(),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            _editProfileController.isNotMobileEditable.value =
                                false;
                            _editProfileController.mobileFocusNode
                                .requestFocus();
                          },
                          child: SubHeading(
                            text: "Edit",
                            color: CustomColors.blueColor.toColor(),
                          ))
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
