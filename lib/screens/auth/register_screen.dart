import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/custom_input.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/auth/registration_controller.dart';
import 'package:kartdaddy/controllers/website_info_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/utility/color_converter.dart';
import 'package:kartdaddy/utility/email_validation.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController _registerController = Get.put(RegisterController());

  final WebsiteInfoController _websiteInfoController = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _referralController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _mobileController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() => _websiteInfoController.loading.value ==
                            true
                        ? CustomCircularProgress()
                        : SvgPicture.network(
                            key: Key("login page header logo"),
                            "https://kartdaddy.in/${_websiteInfoController.websiteInfo.value!.headerLogo}",
                            semanticsLabel: 'login page header logo')),
                  ),
                  const Gap(40),
                  NormalText(
                    text: AppLocalizations.of(context)!.welcome_to_kartdaddy,
                    size: 24,
                  ),
                  NormalText(
                      text: AppLocalizations.of(context)!.signup_welcome_desc),
                  const Gap(60),
                  CustomInput(
                    controller: _mobileController,
                    hint: AppLocalizations.of(context)!.mobile_no,
                    label: const Text("mobile"),
                    prefixIcon: CustomIcons.phone(),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mobile is required";
                      } else if (value.length < 10) {
                        return "10 digit number is required";
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  CustomInput(
                    controller: _emailController,
                    hint: AppLocalizations.of(context)!.email_address,
                    label: const Text("Email"),
                    prefixIcon: CustomIcons.email(),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      } else if (value.contains('@')) {
                        if (!isEmail(email: value)) {
                          return "Email is not valid";
                        }
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  CustomInput(
                    controller: _nameController,
                    hint: AppLocalizations.of(context)!.name,
                    label: const Text("Name"),
                    prefixIcon: CustomIcons.person(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name is required";
                      } else if (value.length < 3) {
                        return "At least 3 character name";
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  CustomInput(
                    controller: _passwordController,
                    hint: AppLocalizations.of(context)!.password,
                    label: const Text("Password"),
                    prefixIcon: CustomIcons.password(),
                    obsecureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  CustomInput(
                    controller: _confirmPasswordController,
                    hint: AppLocalizations.of(context)!.confirm_password,
                    label: const Text("Confirm Password"),
                    prefixIcon: CustomIcons.key(),
                    obsecureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "confirm password is required";
                      } else if (_passwordController.text.length !=
                          _confirmPasswordController.text.length) {
                        return "password and confirm password should be same";
                      }
                      return null;
                    },
                  ),
                  const Gap(20),
                  CustomInput(
                    controller: _referralController,
                    hint: AppLocalizations.of(context)!.referral,
                    label: NormalText(
                        text: AppLocalizations.of(context)!.referral),
                    prefixIcon: CustomIcons.refferal(),
                  ),
                  const Gap(60),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.themeColor.toColor(),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          fixedSize: Size.fromWidth(
                              MediaQuery.of(context).size.width * .8)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _registerController.registerUser(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              mobile: _mobileController.text.trim(),
                              password: _passwordController.text,
                              passwordConfirmation:
                                  _confirmPasswordController.text,
                              referralCode: _referralController.text);
                        }
                        return;
                      },
                      child: NormalText(
                        text: AppLocalizations.of(context)!.get_started,
                      )),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                        text: AppLocalizations.of(context)!
                            .have_an_account("Already"),
                      ),
                      const Gap(3),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: NormalText(
                            text: AppLocalizations.of(context)!.login,
                          ))
                    ],
                  ),
                  // const Gap(80),
                  // const NewsLetterWidget(),
                  // const Gap(30),
                  // const FooterWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
