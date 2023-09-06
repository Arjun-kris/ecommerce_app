import 'package:ecommerce_app1/constants/button.dart';
import 'package:ecommerce_app1/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/images.dart';


class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Images.logo,
                  width: 200,
                  height: 200,
                ),
                const Text(
                  'Ecommerce App',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Discover amazing features and start exploring.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionalTranslation(
              translation: const Offset(0.0, -0.7),
              child: Splashbutton(
                buttonText: 'Get Started',
                buttonfunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninPage(),
                      ));
                }),
            ),
          ),
        ],
      ),
    );
  }
}
