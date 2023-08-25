import 'package:ecommerce_app1/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../utils/navigation_utils.dart';
import '../screens/homescreen.dart';
import '../screens/cartscreen.dart';
import '../screens/wishlist.dart';
import '../screens/coupons.dart';
import '../screens/orderhistory.dart';
import '../screens/helpcenter.dart';

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
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 57.0, 0, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(Images.logo),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Abc",
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "abc@gmail.com",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 170),
              _buildOption(context, Icons.home, "Home", const HomeScreen()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.shopping_cart, "Cart", const CartScreen()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.favorite_border, "Wishlist", const Wishlist()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.wallet_giftcard_rounded, "Coupons", const Coupons()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.history_edu, "Order History", const Orderhistory()),
              const SizedBox(height: 16),
              _buildOption(context, Icons.headset_mic, "Help Center", const Helpcenter()),
              const SizedBox(height: 160),
              _buildOption(context, Icons.logout, "Logout", ChangeNotifierProvider(create: (_) => SigninPageProvider(),child: const SigninPage(),),),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String text, Widget screen) {
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
}

