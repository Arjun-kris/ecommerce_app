import 'package:ecommerce_app1/screens/dashboard.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/Padding.dart';
import '../constants/button.dart';
import '../constants/colors.dart';
import '../constants/images.dart';

class Orderhistory extends StatelessWidget {
  const Orderhistory({super.key});
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 50,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: AppColors.primaryColor,
      mainScreen: const CBody(),
      menuScreen: const DashboardScreen(),
    );
  }
}

class CBody extends StatelessWidget {
  const CBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Order History'),
      body: Padding(
        padding: profilecontain,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.manlaptop,
                    width: 200,
                    height: 200,
                  ),
                  const Text(
                    'No history yet',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Click to below button to Create an order',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Smallbutton(
                    buttonText: 'Start Ordering',
                    buttonfunction: () {},
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
