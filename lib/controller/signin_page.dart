import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:ecommerce_app1/controller/signup_page.dart';
import 'package:ecommerce_app1/utils/forgot_password.dart';
import 'package:ecommerce_app1/constants/text_field_styles.dart';
import 'package:ecommerce_app1/constants/icon.dart';
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
  SigninPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                const SizedBox(height: 50),
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
                const SizedBox(height: 50),
                Container(
                  decoration: textFieldDecoration,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: textFieldTextStyle,
                      border: InputBorder.none,
                      contentPadding: textFieldContentPadding,
                      prefixIcon:
                          Icon(AppIcons.email, color: AppColors.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: textFieldDecoration,
                  child: TextField(
                    controller: passwordController,
                    obscureText:
                        context.watch<SigninPageProvider>().isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: textFieldTextStyle,
                      border: InputBorder.none,
                      contentPadding: textFieldContentPadding,
                      prefixIcon:
                          const Icon(Icons.lock, color: AppColors.primaryColor),
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
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
