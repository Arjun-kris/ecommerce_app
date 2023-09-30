import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/images.dart';

class AddupiPage extends StatelessWidget {
  const AddupiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: profilecontain,
        child: Stack(
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
                    'No Upi',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
