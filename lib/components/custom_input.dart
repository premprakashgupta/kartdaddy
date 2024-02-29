import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget label;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obsecureText;
  const CustomInput(
      {super.key,
      this.controller,
      required this.hint,
      required this.label,
      this.prefixIcon, this.keyboardType, this.obsecureText=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
