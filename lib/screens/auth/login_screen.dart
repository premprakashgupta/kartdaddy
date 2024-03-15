import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/components/custom_input.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/controllers/auth/login_controller.dart';
import 'package:kartdaddy/controllers/landing_controller.dart';
import 'package:kartdaddy/controllers/website_info_controller.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/auth/forget_password_screen.dart';
import 'package:kartdaddy/screens/auth/register_screen.dart';
import 'package:kartdaddy/utility/email_validation.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find();
  final WebsiteInfoController _websiteInfoController = Get.find();
  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Obx(() => _websiteInfoController.loading.value == true
                            ? CustomCircularProgress()
                            : CachedNetworkImage(
                                imageUrl:
                                    "https://kartdaddy.in/${_websiteInfoController.websiteInfo.value!.headerLogo}",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CustomCircularProgress(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/kartdaddy-logo.png"),
                              )),
                  ),
                  const Gap(40),
                  NormalText(
                    text: AppLocalizations.of(context)!.welcome_back,
                    size: 24,
                  ),
                  // NormalText(
                  //     text: AppLocalizations.of(context)!.login_welcome_desc),
                  const Gap(50),
                  CustomInput(
                    hint: AppLocalizations.of(context)!.mobile_no_email,
                    label: NormalText(
                        text: AppLocalizations.of(context)!.mobile_no_email),
                    prefixIcon: CustomIcons.phone(),
                    controller: _loginIdController,
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
                    hint: AppLocalizations.of(context)!.password,
                    label: NormalText(
                        text: AppLocalizations.of(context)!.password),
                    prefixIcon: CustomIcons.password(),
                    obsecureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      // in future we have to implement strong password validation
                      return null;
                    },
                  ),
                  const Gap(30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => const ForgetPasswordScreen());
                        },
                        child: NormalText(
                            text:
                                AppLocalizations.of(context)!.forgot_password)),
                  ),
                  const Gap(30),
                  Obx(
                    () => CustomButton(
                        size: Size.fromWidth(
                            MediaQuery.of(context).size.width * .8),
                        onPressed: _loginController.disabled.value == true
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, navigate to HomeScreen
                                  _loginController.loginUser(
                                      login_id: _loginIdController.text.trim(),
                                      password: _passwordController.text);
                                }
                                return;
                              },
                        child: NormalText(
                          text: AppLocalizations.of(context)!.login,
                        )),
                  ),

                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                        text: AppLocalizations.of(context)!
                            .have_an_account("Don't"),
                      ),
                      const Gap(5),
                      InkWell(
                          onTap: () {
                            Get.to(() => RegisterScreen());
                          },
                          child: NormalText(
                            text: AppLocalizations.of(context)!.sign_up,
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
