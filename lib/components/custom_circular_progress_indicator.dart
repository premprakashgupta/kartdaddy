import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.amber,
      ),
    );
  }
}
