import 'package:bookstore_app/core/magic_router/magic_router.dart';
import 'package:bookstore_app/core/services/dio_helper.dart';
import 'package:bookstore_app/core/widgets/navigation_bar.dart';
import 'package:bookstore_app/features/cart/view/presentation/cart_screen.dart';
import 'package:bookstore_app/features/home/view/presentation/home_screen.dart';
import 'package:bookstore_app/features/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _initAsync() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    DioHelper.token = token;
    print('Token: $token');

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    if (token != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavigationBarScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/image/books_im.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill),
          Positioned(
              top: 250,
              left: 100,
              child: SvgPicture.asset(
                'assets/logo.svg',
                height: 50,
                width: 85,
              )),
        ],
      ),
    );
  }
}
