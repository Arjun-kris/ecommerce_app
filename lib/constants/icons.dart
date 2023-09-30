import 'package:ecommerce_app1/constants/colors.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const IconData email = Icons.email_outlined;
  static const IconData phone = Icons.phone_outlined;
  static const IconData person = Icons.person_outlined;
  static const IconData lock = Icons.lock_outlined;
  static const IconData name = Icons.person_outlined;
  static const camera = CircleAvatar(
    backgroundColor: AppColors.primaryColor,
    child: Icon(Icons.camera_alt_outlined, color: AppColors.accentColor),
  );
}
