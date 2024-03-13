import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  final double? value;
  const CustomCircularProgress({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.amber,
        value: value ?? null,
      ),
    );
  }
}
