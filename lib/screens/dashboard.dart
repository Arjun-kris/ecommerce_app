import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/profile_model.dart';
import '../utils/navigation_utils.dart';
import '../screens/homescreen.dart';
import '../screens/cartscreen.dart';
import '../screens/wishlist.dart';
import '../screens/coupons.dart';
import '../screens/orderhistory.dart';
import '../screens/helpcenter.dart';
import '../utils/signout_utils.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfile(context, profilemodel),
              const SizedBox(height: 170),
              _buildOption(context, Icons.home, "Home", const HomeScreen()),
              const SizedBox(height: 16),
              _buildOption(
                  context, Icons.shopping_cart, "Cart", const CartScreen()),
              const SizedBox(height: 16),
              _buildOption(
                  context, Icons.favorite_border, "Wishlist", const Wishlist()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.wallet_giftcard_rounded, "Coupons",
                  const Coupons()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.history_edu, "Order History",
                  const Orderhistory()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.headset_mic, "Help Center",
                  const Helpcenter()),
              const SizedBox(height: 160),
              _buildSignout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context, List<ProfileModel> profileList) {
    if (profileList.isEmpty) {
    return Container();
  }
  String name = profileList[0].name;
  String email = profileList[0].email;


    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 57.0, 0, 0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile_images/profile.jpg'),
                ),
                const SizedBox(width: 12.0),
                Text(
                  name,
                  style: const TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            email,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, IconData icon, String text, Widget screen) {
    return InkWell(
      onTap: () {
        navigateToPage(context, screen);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.0,
              color: Colors.white,
            ),
            const SizedBox(width: 8.0),
            Text(
              text,
              style: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignout(BuildContext context) {
    return InkWell(
      onTap: () {
        SignOutUtils().showSignout1Dialog(context);
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
        child: Row(
          children: [
            Icon(
              Icons.logout,
              size: 20.0,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text(
              "Logout",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
