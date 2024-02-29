import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_input.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/screens/auth/forget_password_screen.dart';
import 'package:kartdaddy/screens/auth/register_screen.dart';
import 'package:kartdaddy/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  text: AppLocalizations.of(context)!.welcome_back,
                  size: 24,
                ),
                // NormalText(
                //     text: AppLocalizations.of(context)!.login_welcome_desc),
                const Gap(50),
                CustomInput(
                  hint: AppLocalizations.of(context)!.mobile_no_email,
                  label:  NormalText(text: AppLocalizations.of(context)!.mobile_no_email),
                  prefixIcon: CustomIcons.phone(),
                  keyboardType: TextInputType.number,
                ),
                const Gap(20),
                CustomInput(
                  hint: AppLocalizations.of(context)!.password,
                  label: NormalText(text: AppLocalizations.of(context)!.password),
                  prefixIcon: CustomIcons.password(),
                  obsecureText: true,
                ),
                const Gap(30),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => const ForgetPasswordScreen());
                      },
                      child: NormalText(text:AppLocalizations.of(context)!.forgot_password)),
                ),
                const Gap(30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * .8)),
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    },
                    child: NormalText(
                      text: AppLocalizations.of(context)!.login,
                    )),
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
                          Get.to(() => const RegisterScreen());
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
    );
  }
}
