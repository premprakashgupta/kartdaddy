import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/heading_widget.dart';
import 'package:kartdaddy/components/subheading_widget.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  final String place;
  const ErrorScreen({super.key, required this.error, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Heading(text: "Something went wrong from $place"),
            Gap(10),
            OutlinedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text("Go back")),
            Gap(20),
            SubHeading(
              text: error,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
