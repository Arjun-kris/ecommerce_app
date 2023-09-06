import 'package:flutter/material.dart';
import 'colors.dart';
import 'Padding.dart';
import 'text_field_styles.dart';

final textFieldDecoration = BoxDecoration(
  border: Border.all(
    color: AppColors.secondaryColor,
    width: 0.6,
  ),
  borderRadius: BorderRadius.circular(8.0),
);


InputDecoration normalInput({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: hint2,
    border: InputBorder.none,
    contentPadding: textFieldContentPadding,
  );
}


InputDecoration customInput({required String hintText, required Icon prefixIcon}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: hint,
    border: InputBorder.none,
    contentPadding: textFieldContentPadding,
    prefixIcon: prefixIcon,
  );
}

InputDecoration passswordInput({required String hintText, required Icon prefixIcon, required suffixIcon}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: hint,
    border: InputBorder.none,
    contentPadding: textFieldContentPadding,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );
}

