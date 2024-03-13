import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/controllers/cartController.dart';
import 'package:kartdaddy/screens/product_details_screen.dart';

import 'screens/landing_screen.dart';

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
  const MyApp({super.key, this.savedLanguage});

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
      getPages: [
        GetPage(
          name: '/productDetails',
          page: () => ProductDetailsScreen(),
        ),
        // Add other pages/routes as needed
      ],
      home: LandingScreen(),
    );
  }
}
