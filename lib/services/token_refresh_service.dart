import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kartdaddy/api/auth.dart';

class TokenRefreshService extends GetxService {
  final box = GetStorage();
  late Timer _tokenRefreshTimer;

  void startTokenRefreshTimer({required int expireIn}) {
    print("Timer start");
    int loginAt = box.read('login_at') ?? 0;
    Duration refreshInterval = Duration(seconds: loginAt + expireIn - 10);
    print(refreshInterval);
    _tokenRefreshTimer = Timer.periodic(refreshInterval, (timer) {
      refreshToken();
    });
  }

  Future<void> refreshToken() async {
    try {
      var accessToken = box.read('access_token');
      var response = await http.post(
        Uri.parse(AuthApi.me),
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        var newAccessToken = jsonData['access_token'];
        var expireIn = jsonData['expire_in'];
        box.write('access_token', newAccessToken);
        box.write('expire_in', expireIn);

        startTokenRefreshTimer(expireIn: expireIn);
      } else {
        print('Error refreshing token: ${response.statusCode}');
      }
    } catch (e) {
      print('Error refreshing token: $e');
    }
  }

  void stopTokenRefreshTimer() {
    _tokenRefreshTimer.cancel();
  }

  @override
  void onClose() {
    _tokenRefreshTimer.cancel();
    print("cancel timer");
    super.onClose();
  }
}
