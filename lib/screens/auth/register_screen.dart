import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_input.dart';
import 'package:kartdaddy/components/normal_text_widget.dart';
import 'package:kartdaddy/designs/custom_icons.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  hint: AppLocalizations.of(context)!.mobile_no,
                  label: const Text("mobile"),
                  prefixIcon: CustomIcons.phone(),
                  keyboardType: TextInputType.number,
                ),
                const Gap(20),
                CustomInput(
                  hint: AppLocalizations.of(context)!.email_address,
                  label: const Text("Email"),
                  prefixIcon: CustomIcons.email(),
                  keyboardType: TextInputType.emailAddress,
                ),
                const Gap(20),
                CustomInput(
                  hint: AppLocalizations.of(context)!.username,
                  label: const Text("Username"),
                  prefixIcon: CustomIcons.person(),
                  
                ),
                const Gap(20),
                CustomInput(
                  hint: AppLocalizations.of(context)!.password,
                  label: const Text("Password"),
                  prefixIcon: CustomIcons.password(),
                  obsecureText: true,
                ),
                const Gap(20),
                CustomInput(
                  hint: AppLocalizations.of(context)!.confirm_password,
                  label: const Text("Confirm Password"),
                  prefixIcon: CustomIcons.key(),
                  obsecureText: true,
                ),
                const Gap(20),
                CustomInput(
                  hint: AppLocalizations.of(context)!.referral,
                  label:  NormalText(text: AppLocalizations.of(context)!.referral),
                  prefixIcon: CustomIcons.refferal(),
                  
                ),
                const Gap(60),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width * .8)),
                    onPressed: () {},
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
