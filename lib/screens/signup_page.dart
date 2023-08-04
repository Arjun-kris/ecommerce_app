import 'package:ecommerce_app1/constants/colors.dart';
import 'package:ecommerce_app1/constants/decoration.dart';
import 'package:ecommerce_app1/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app1/constants/icons.dart';
import 'package:ecommerce_app1/controllers/signdata_provider.dart';
import 'package:ecommerce_app1/constants/images.dart';
import '../utils/dialog_utils.dart';


class SignupPage extends StatelessWidget {


  const SignupPage({super.key});

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
                      controller: TextEditingControllers.nameController,
                      decoration: customInput(
                      hintText: 'Name',
                      prefixIcon: const Icon(AppIcons.name, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: TextEditingControllers.phoneController,
                      decoration: customInput(
                      hintText: 'Phone',
                      prefixIcon: const Icon(AppIcons.phone, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: TextEditingControllers.emailController,
                      decoration: customInput(
                      hintText: 'Email',
                      prefixIcon: const Icon(AppIcons.email, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: TextEditingControllers.passwordController,
                      obscureText:
                          context.watch<SignupPageProvider>().isPasswordVisible,
                      decoration: passswordInput(
                        hintText: 'Password',
                        prefixIcon: const Icon(AppIcons.lock,
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
                      controller: TextEditingControllers.confirmPasswordController,
                      obscureText: context
                          .watch<SignupPageProvider>()
                          .isConfirmPasswordVisible,
                      decoration: passswordInput(
                        hintText: 'Confirm Password',
                        prefixIcon: const Icon(AppIcons.lock, color: AppColors.primaryColor),
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
                      DialogUtils.showSuccessDialog(context);
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
                                child: const SigninPage(),
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
}
