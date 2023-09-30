import 'package:ecommerce_app1/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import 'package:ecommerce_app1/screens/signin_page.dart';
import '../screens/homescreen.dart';
import '../screens/profilescreen.dart';

class SignOutUtils {
  static void showSignoutDialog(BuildContext context, ProfileModel profilemodel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.redColor)),
          content: const Text('Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(profilemodel: profilemodel),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: const Size(80, 50),
                  ),
                  child: const Text('No'),
                ),
                const SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (_) => SigninPageProvider(),
                          child: const SigninPage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: const Size(80, 50),
                  ),
                  child: const Text('Yes'),
                ),
              ],
            ),
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }


  void showSignout1Dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.redColor)),
          content: const Text('Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen()
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: const Size(80, 50),
                  ),
                  child: const Text('No'),
                ),
                const SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (_) => SigninPageProvider(),
                          child: const SigninPage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: const Size(80, 50),
                  ),
                  child: const Text('Yes'),
                ),
              ],
            ),
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }

}
