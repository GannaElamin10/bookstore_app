import 'package:bookstore_app/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BookStore_App());
}

class BookStore_App extends StatelessWidget {
  BookStore_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
