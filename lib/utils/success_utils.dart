import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/showaddress.dart';

class SuccessUtils {
  void showAddressSuccessDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          actions: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddressPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  fixedSize: const Size(80, 50),
                ),
                child: const Text('OK'),
              ),
            ),
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }
}
