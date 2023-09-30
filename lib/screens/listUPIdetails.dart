// ignore_for_file: file_names

import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/constants/button.dart';
import 'package:ecommerce_app1/screens/addupipage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/images.dart';

import '../widgets/AppBar.dart';

class ListupiPage extends StatelessWidget {
  const ListupiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Saved UPI'),
      body: Padding(
        padding: profilecontain,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.upi,
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    'Save Your UPI',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Click to below button to save UPI',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  Smallbutton(
                    buttonText: 'Save UPI',
                    buttonfunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddupiPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
