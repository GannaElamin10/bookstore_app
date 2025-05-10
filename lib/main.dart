import 'package:bookstore_app/features/onboarding/splash_screen.dart';
import 'package:bookstore_app/features/order/cart_screen.dart';
import 'package:bookstore_app/features/profile/change_passowrd_screen.dart';
import 'package:bookstore_app/features/profile/edit_profile_screen.dart';
import 'package:bookstore_app/features/profile/help_screen.dart';
import 'package:bookstore_app/features/profile/profile_screen.dart';
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
      home: ProfilePage(),
      // home: SplashScreen(),
    );
  }
}
