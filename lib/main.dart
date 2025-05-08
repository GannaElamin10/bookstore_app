import 'package:bookstore_app/core/utils/service_locator.dart';
import 'package:bookstore_app/features/auth/cubit/auth_cubit.dart';
import 'package:bookstore_app/features/auth/data/model/repo/auth_repo_imp.dart';
import 'package:bookstore_app/features/home/data/repo/home_repo_imp.dart';
import 'package:bookstore_app/features/home/view/presentation/manger/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookstore_app/features/home/view/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookstore_app/features/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(BookStore_App());
}

// ignore: camel_case_types
class BookStore_App extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  BookStore_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBookCubit(getIt.get<HomeRepoImp>())..fetchfeatureBooks()),
        BlocProvider(
            create: (context) => NewestBooksCubit(getIt.get<HomeRepoImp>())),
       
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(fontFamily: GoogleFonts.openSans().fontFamily),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
