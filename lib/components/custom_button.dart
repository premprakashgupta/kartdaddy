import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Size? size;

  const CustomButton({super.key, required this.child, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: onPressed == null ? Colors.grey : Colors.amber,
        fixedSize: size,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
