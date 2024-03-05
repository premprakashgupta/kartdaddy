import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:kartdaddy/screens/auth/login_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/shimmer/grid_shimmer.dart';
import 'package:kartdaddy/shimmer/list_shimmer.dart';

import 'controllers/auth/login_controller.dart';
import 'screens/landing_screen.dart';
import 'services/token_refresh_service.dart';

void main() async {
  await GetStorage.init();

  // Initialize GetStorage
  final box = GetStorage();

  // Get the saved language preference
  String? savedLanguage = box.read('language');
  
  runApp(MyApp(savedLanguage: savedLanguage));
}

class MyApp extends StatelessWidget {
  final String? savedLanguage;
  const MyApp({Key? key, this.savedLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Localizations Sample App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.grey.shade100),
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: savedLanguage != null ? Locale(savedLanguage!) : null,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
      ],
      home: LandingScreen(),
    );
  }
}
