import 'package:bookstore_app/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BookStore_App());
}

class BookStore_App extends StatelessWidget {
  BookStore_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

