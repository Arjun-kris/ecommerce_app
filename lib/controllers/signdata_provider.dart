import 'package:flutter/material.dart';

class SignupData with ChangeNotifier {
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }
}

class TextEditingControllers {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneController = TextEditingController();
  static final passwordController = TextEditingController();
  static final confirmPasswordController = TextEditingController();
}

class SignupPageProvider extends ChangeNotifier {
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }
}

