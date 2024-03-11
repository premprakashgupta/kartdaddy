
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/screens/auth/reset_password_screen.dart';

import '../../components/normal_text_widget.dart';
import '../../components/subheading_widget.dart';
class OTPVerificationScreen extends StatefulWidget {
  final int otp;
  const OTPVerificationScreen({
    super.key,
    required this.otp,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  late String newOtp;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NormalText(text:'OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SubHeading(text: "OTP Verification",color: Colors.black,),
              const Gap(20),
              const NormalText(text: "Please check your email or mobile to get OTP.",maxLines: 4,),
              const Gap(40),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.amber,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // handle validation or checks here
                },
                onSubmit: (String verificationCode) {
                  setState(() {
                    newOtp = verificationCode;
                  });
                },
              ),
              const Gap( 20),
              CustomButton(
                size:  Size.fromWidth(MediaQuery.of(context).size.width),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle verifying OTP (navigate to ResetPasswordScreen)
                    print(newOtp);
                    if (widget.otp.toString() == newOtp) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(),
                        ),
                      );
                    } else {
                      print("wrong otp");
                    }
                  }
                },
                child: const NormalText(text:'Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
