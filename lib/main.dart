import 'package:ecommerce_app1/screens/signin_page.dart';
import 'package:ecommerce_app1/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SigninPageProvider(),
      child: const GetStartedApp(),
    ),
  );
}

class GetStartedApp extends StatelessWidget {
  const GetStartedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const GetStartedPage(),
    );
  }
}
