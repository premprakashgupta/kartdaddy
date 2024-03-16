import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_input.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/auth/registration_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/utility/color_converter.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final RegisterController _registerController = Get.put(RegisterController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/kartdaddy-logo.png"),
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
                ),
                const Gap(20),
                CustomInput(
                  controller: _emailController,
                  hint: AppLocalizations.of(context)!.email_address,
                  label: const Text("Email"),
                  prefixIcon: CustomIcons.email(),
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(20),
                CustomInput(
                  controller: _nameController,
                  hint: AppLocalizations.of(context)!.name,
                  label: const Text("Name"),
                  prefixIcon: CustomIcons.person(),
                ),
                const Gap(20),
                CustomInput(
                  controller: _passwordController,
                  hint: AppLocalizations.of(context)!.password,
                  label: const Text("Password"),
                  prefixIcon: CustomIcons.password(),
                  obsecureText: true,
                ),
                const Gap(20),
                CustomInput(
                  controller: _confirmPasswordController,
                  hint: AppLocalizations.of(context)!.confirm_password,
                  label: const Text("Confirm Password"),
                  prefixIcon: CustomIcons.key(),
                  obsecureText: true,
                ),
                const Gap(20),
                CustomInput(
                  controller: _referralController,
                  hint: AppLocalizations.of(context)!.referral,
                  label:
                      NormalText(text: AppLocalizations.of(context)!.referral),
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
                      _registerController.registerUser(
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          mobile: _mobileController.text.trim(),
                          password: _passwordController.text,
                          passwordConfirmation: _confirmPasswordController.text,
                          referralCode: _referralController.text);
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
    );
  }
}
