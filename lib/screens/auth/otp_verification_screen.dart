import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/controllers/auth/otp_verification_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/utility/color_converter.dart';

import '../../components/normal_text_widget.dart';
import '../../components/subheading_widget.dart';

class OTPVerificationScreen extends StatelessWidget {
  final bool forgetPass;
  final OtpVerificationController _otpVerificationController =
      Get.put(OtpVerificationController());

  OTPVerificationScreen({super.key, required this.forgetPass});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NormalText(text: 'OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SubHeading(
              text: "OTP Verification",
              color: Colors.black,
            ),
            const Gap(20),
            const NormalText(
              text: "Please check your email or mobile to get OTP.",
              maxLines: 4,
            ),
            const Gap(40),
            OtpTextField(
              numberOfFields: 6,
              borderColor: CustomColors.themeColor.toColor(),
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                _otpVerificationController.newOtp.value = verificationCode;
              },
            ),
            const Gap(20),
            CustomButton(
              size: Size.fromWidth(MediaQuery.of(context).size.width),
              onPressed: () {
                // Handle verifying OTP (navigate to ResetPasswordScreen)
                print(_otpVerificationController.newOtp.value);
                if (_otpVerificationController.newOtp.value != '') {
                  print("otp if condition 51 line");
                  if (forgetPass == true) {
                    _otpVerificationController.verifyOtpForForgetPassword();
                  } else {
                  _otpVerificationController.onOtpSubmit();

                  }

                } else {
                  print("6 digit otp is required");
                }
              },
              child: const NormalText(text: 'Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
