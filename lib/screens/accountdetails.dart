import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import 'package:provider/provider.dart';
import '../constants/decoration.dart';
import '../constants/icons.dart';
import '../constants/images.dart';
import '../controllers/signdata_provider.dart';
import '../models/product.dart';

class AccountDetails extends StatelessWidget {
  final Product? product;

  const AccountDetails({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Account Details',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                  image: DecorationImage(
                    image: AssetImage(Images.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.topCenter,
              child: Text('Abc', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                decoration: normalInput(hintText: 'Phone Number'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                decoration: normalInput(hintText: 'Name'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                decoration: normalInput(hintText: 'Email'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                decoration: normalInput(hintText: 'Password'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                decoration: normalInput(hintText: 'Confirm Password'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                    onPressed: () {
                      Navigator.push(
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
                    child:
                        const Text('Update Information', style: TextStyle(fontSize: 21)),
                  ),
                  
          ],
        ),
      ),
    );
  }
}
