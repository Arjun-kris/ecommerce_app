import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/decoration.dart';
import '../constants/icons.dart';
import '../controllers/signdata_provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your email or Phone number associated with this account to send verification code.',
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              child: TextField(
                controller: TextEditingControllers.emailController,
                decoration: customInput(
                  hintText: 'Email',
                  prefixIcon:
                      const Icon(AppIcons.email, color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
                child: Text(
                    '------------------------- OR -------------------------',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16))),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: TextField(
                controller: TextEditingControllers.phoneController,
                decoration: customInput(
                  hintText: 'Phone Number',
                  prefixIcon:
                      const Icon(AppIcons.phone, color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: AppColors.primaryColor,
              ),
              child: const Text('Continue', style: TextStyle(fontSize: 21)),
            ),
          ],
        ),
      ),
    );
  }
}
