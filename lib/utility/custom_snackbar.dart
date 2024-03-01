import 'package:get/get.dart';

class CustomSnackbar {
  static showSnackbar({required String title, required String message}) {
    return Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
