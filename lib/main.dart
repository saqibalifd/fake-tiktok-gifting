import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/screens/splash_screen.dart';

import 'package:tiktok/utils/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kWhiteColor,

        colorScheme: const ColorScheme.dark(
          primary: kRedColor,
          secondary: kCyanColor,
          tertiary: kGreenColor,
          surface: kDarkGreyColor,
          onPrimary: kWhiteColor,
          onSurface: kLightGreyColor,
        ),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: const SplashScreen(),
    );
  }
}
