import 'package:flutter/material.dart';
import '../screens/homescreen.dart';

void navigateToPage(BuildContext context, Widget page) {
  final navigator = Navigator.of(context);
  z.close?.call()?.then(
    (value) => navigator.push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    ),
  );
}
