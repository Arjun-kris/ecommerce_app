import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/homescreen.dart';

class DialogUtils {
  static void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account Created successfully!', textAlign: TextAlign.center,),
          content: const Text('Your account has been created successfully!', textAlign: TextAlign.center,),
          actions: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: const Size(80, 50),
                  ),
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }
}
