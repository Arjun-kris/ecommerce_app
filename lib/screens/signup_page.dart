import 'package:ecommerce_app1/constants/colors.dart';
import 'package:ecommerce_app1/constants/text_field_styles.dart';
import 'package:ecommerce_app1/constants/decoration.dart';
import 'package:ecommerce_app1/constants/padding.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:ecommerce_app1/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app1/controllers/signup_provider.dart';
import 'package:ecommerce_app1/constants/images.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupPageProvider>(builder: (context, provider, _) {
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
                      'Sign up !',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: textFieldTextStyle,
                        border: InputBorder.none,
                        contentPadding: textFieldContentPadding,
                        prefixIcon:
                            Icon(Icons.person, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        labelStyle: textFieldTextStyle,
                        border: InputBorder.none,
                        contentPadding: textFieldContentPadding,
                        prefixIcon:
                            Icon(Icons.phone, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: textFieldTextStyle,
                        border: InputBorder.none,
                        contentPadding: textFieldContentPadding,
                        prefixIcon:
                            Icon(Icons.email, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: passwordController,
                      obscureText:
                          context.watch<SignupPageProvider>().isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: textFieldTextStyle,
                        border: InputBorder.none,
                        contentPadding: textFieldContentPadding,
                        prefixIcon: const Icon(Icons.lock,
                            color: AppColors.primaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            context
                                    .watch<SignupPageProvider>()
                                    .isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            context
                                .read<SignupPageProvider>()
                                .togglePasswordVisibility();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: context
                          .watch<SignupPageProvider>()
                          .isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: textFieldTextStyle,
                        border: InputBorder.none,
                        contentPadding: textFieldContentPadding,
                        prefixIcon: const Icon(Icons.lock,
                            color: AppColors.primaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            context
                                    .watch<SignupPageProvider>()
                                    .isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            context
                                .read<SignupPageProvider>()
                                .toggleConfirmPasswordVisibility();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      _showSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      fixedSize: const Size(400, 50),
                    ),
                    child:
                        const Text('SIGN UP', style: TextStyle(fontSize: 21)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
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
                              builder: (context) => ChangeNotifierProvider(
                                create: (_) => SigninPageProvider(),
                                child: SigninPage(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign in',
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
    });
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Account created successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
