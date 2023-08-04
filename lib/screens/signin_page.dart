import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:ecommerce_app1/screens/signup_page.dart';
import 'package:ecommerce_app1/controllers/signdata_provider.dart';
import 'package:ecommerce_app1/screens/forgot_password.dart';
import 'package:ecommerce_app1/constants/decoration.dart';
import 'package:ecommerce_app1/constants/icons.dart';
import 'package:ecommerce_app1/constants/images.dart';

class SigninPageProvider extends ChangeNotifier {
  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: AssetImage(Images.logo),
                    width: 100,
                    height: 100,
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 90),
                Container(
                  decoration: textFieldDecoration,
                  child: TextField(
                    controller: TextEditingControllers.emailController,
                    decoration: customInput(
                      hintText: 'Email',
                      prefixIcon: const Icon(AppIcons.email,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: textFieldDecoration,
                  child: TextField(
                    controller: TextEditingControllers.passwordController,
                    obscureText:
                        context.watch<SigninPageProvider>().isPasswordVisible,
                    decoration: passswordInput(
                      hintText: 'Password',
                      prefixIcon: const Icon(AppIcons.lock,
                          color: AppColors.primaryColor),
                      suffixIcon: IconButton(
                        icon: Icon(
                          context.watch<SigninPageProvider>().isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          context
                              .read<SigninPageProvider>()
                              .togglePasswordVisibility();
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      _showForgotPasswordBottomSheet(context);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: const Size(400, 50),
                  ),
                  child: const Text('LOG IN', style: TextStyle(fontSize: 21)),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showForgotPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const ForgotPasswordScreen();
      },
    );
  }
}
