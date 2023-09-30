import 'package:ecommerce_app1/models/profile_model.dart';
import 'package:ecommerce_app1/screens/aboutusscreen.dart';
import 'package:ecommerce_app1/screens/accountdetails.dart';
import 'package:ecommerce_app1/screens/listUPIdetails.dart';
import 'package:ecommerce_app1/screens/supercoinscreen.dart';
import 'package:ecommerce_app1/screens/termsandconditions.dart';
import 'package:ecommerce_app1/utils/signout_utils.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:ecommerce_app1/widgets/bottomnavigation.dart';
import 'package:ecommerce_app1/widgets/profilelist.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/screens/dashboard.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:ecommerce_app1/screens/listcarddetails.dart';
import 'package:ecommerce_app1/screens/showaddress.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/colors.dart';

class ProfilePage extends StatelessWidget {
  final ProfileModel profilemodel;

  const ProfilePage({required this.profilemodel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 50,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: AppColors.primaryColor,
      mainScreen: CBody(profilemodel: profilemodel),
      menuScreen: const DashboardScreen(),
    );
  }
}

class CBody extends StatelessWidget {
  final ProfileModel profilemodel;

  const CBody({required this.profilemodel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Scaffold(
              appBar: const NormalAppBar(appTitle: 'Profile'),
              bottomNavigationBar: const Bottomnavigation(currentindex: 4),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: const Floatingactionbutton(),
              body: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildProfileCard(context, profilemodel),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildProfileCard(BuildContext context, ProfileModel profilemodel) {
  if (profilemodel.imageFile != null) {}

  return Padding(
    padding: profilecontain,
    child: Column(
      children: [
        Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
              image: DecorationImage(
                image: AssetImage('assets/profile_images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(profilemodel.name,
              style:
                  const TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
        ),
        const SizedBox(height: 20),
        ProfileList(
            profileText: 'Account Details',
            leadingIcon: Icons.person_2_outlined,
            profilefunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AccountDetails(profileModel: profilemodel)),
              );
            }),
        ProfileList(
            profileText: 'Address',
            leadingIcon: Icons.location_on_outlined,
            profilefunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddressPage(),
                ),
              );
            }),
        ExpandList(
            profileText: 'Payment',
            leadingIcon: Icons.payment_outlined,
            profilefunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListCardDetails(),
                ),
              );
            },
            profilefunction2: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListupiPage(),
                ),
              );
            }),
        ProfileList(
            profileText: 'Super Coins',
            leadingIcon: Icons.monetization_on_outlined,
            profilefunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuperCoinScreen(),
                ),
              );
            }),
        ProfileList(
            profileText: 'About us',
            leadingIcon: Icons.live_help_outlined,
            profilefunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUsScreen(),
                ),
              );
            }),
        ProfileList(
            profileText: 'Terms and Conditions',
            leadingIcon: Icons.info_outline_rounded,
            profilefunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Termsandconditions(),
                ),
              );
            }),
        SignoutList(
            profileText: 'Sign Out',
            leadingIcon: Icons.logout,
            profilefunction: () {
              SignOutUtils.showSignoutDialog(context, profilemodel);
            }),
      ],
    ),
  );
}
