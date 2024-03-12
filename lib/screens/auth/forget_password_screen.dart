import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kartdaddy/components/custom_button.dart';
import 'package:kartdaddy/components/subheading_widget.dart';
import 'package:kartdaddy/screens/auth/otp_verification_screen.dart';

import '../../components/normal_text_widget.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int otp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                const SubHeading(text: "Forget Password",color: Colors.black,),
                const Gap(20),
                const NormalText(text: "If your email or mobile is available in database then you will get otp on registered email or mobile",maxLines: 4,),
                const Gap(40),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more email validation logic here if needed
                    return null;
                  },
                ),
                const Gap( 20),
                CustomButton(
                  size:  Size.fromWidth(MediaQuery.of(context).size.width),
                  
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, proceed with sending OTP
                      setState(() {
                        var tempOtp = Random().nextInt(999999);
                        print(tempOtp); // Generate a random 6-digit OTP
                        otp = tempOtp;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: NormalText(text:"your otp : $tempOtp")));
                      });
                  
            
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPVerificationScreen(),
                        ),
                      );
                    }
                  },
                  child: const NormalText(text:'Send OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}