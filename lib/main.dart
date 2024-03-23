import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:kartdaddy/controllers/website_info_controller.dart';
import 'package:kartdaddy/designs/colors.dart';
import 'package:kartdaddy/screens/product/product_details_screen.dart';
import 'package:kartdaddy/utility/color_converter.dart';

import 'screens/landing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Initialize GetStorage
  final box = GetStorage();

  // Get the saved language preference
  String? savedLanguage = box.read('language');
  // website infi
  Get.put(WebsiteInfoController());
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
        appBarTheme: AppBarTheme(color: CustomColors.greyColor.toColor()),
        scaffoldBackgroundColor: Colors.white,
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
      defaultTransition: Transition.fadeIn,
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
