import 'package:flutter/material.dart';
import '../constants/Padding.dart';
import '../widgets/AppBar.dart';

class SuperCoinScreen extends StatelessWidget {
  const SuperCoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NormalAppBar(appTitle: 'Super Coins'),
      body: Padding(
        padding: profilecontain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  /////
          children: [
            Text(
              'This feature will be activated soon',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26,
              fontWeight: FontWeight.normal
              ),
            )
          ],
        )
      ),
    );
  }
}
