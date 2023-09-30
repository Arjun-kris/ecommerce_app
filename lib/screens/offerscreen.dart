import 'package:ecommerce_app1/screens/dashboard.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/colors.dart';
import '../widgets/AppBar.dart';
import '../widgets/bottomnavigation.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return const Stack(
          children: <Widget>[
            Scaffold(
              appBar: NormalAppBar(appTitle: 'Offers'),
              bottomNavigationBar: Bottomnavigation(currentindex: 3),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Floatingactionbutton(),
            ),
          ],
        );
      },
    );
  }
}
