import 'package:bookstore_app/core/services/dio_helper.dart';
import 'package:bookstore_app/features/onboarding/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
 
  DioHelper.init();
  runApp(BookStore_App());
}

// ignore: camel_case_types
class BookStore_App extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BookStore_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
      debugShowCheckedModeBanner: false,
      // home: ProfilePage(),
      home: SplashScreen(),
    );
  }
}
