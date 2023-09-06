import 'package:ecommerce_app1/constants/colors.dart';
import 'package:flutter/material.dart';

class Commonbutton extends StatelessWidget {
  const Commonbutton(
      {Key? key, required this.buttonText, required this.buttonfunction})
      : super(key: key);
  final String buttonText;
  final void Function() buttonfunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonfunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: const Size(400, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class Splashbutton extends StatelessWidget {
  const Splashbutton(
      {Key? key, required this.buttonText, required this.buttonfunction})
      : super(key: key);
  final String buttonText;
  final void Function() buttonfunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonfunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: const Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}