import 'package:ecommerce_app1/screens/dashboard.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/colors.dart';

class Helpcenter extends StatelessWidget {
  const Helpcenter({super.key});
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 50,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: AppColors.primaryColor,
      mainScreen: const cBody(),
      menuScreen: const DashboardScreen(),
    );
  }
}

class cBody extends StatelessWidget {
  const cBody({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text("Helpcenter",
                    style: TextStyle(color: AppColors.primaryColor)),
                elevation: 0.0,
                leading: IconButton(
                  color: AppColors.primaryColor,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    z.toggle!();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
