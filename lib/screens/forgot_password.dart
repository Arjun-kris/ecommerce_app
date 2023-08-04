import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/decoration.dart';
import '../constants/icons.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enter your email or Phone number associated with this account to send verification code.',
            ),
            TextFormField(
              decoration: customInput(
                hintText: 'Email',
                prefixIcon:
                    const Icon(AppIcons.email, color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: customInput(
                hintText: 'Phone',
                prefixIcon: const Icon(AppIcons.phone, color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
