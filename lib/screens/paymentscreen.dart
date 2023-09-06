import 'package:ecommerce_app1/constants/button.dart';
import 'package:ecommerce_app1/constants/decoration.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/images.dart';
import '../models/product.dart';
import '../controllers/payment_provider.dart';
import 'homescreen.dart';

class PaymentPage extends StatelessWidget {
  final Product? product;

  const PaymentPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Add Card', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              Images.card,
              fit: BoxFit.contain,
              width: 600,
              height: 300,
            ),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: addrPayment.cnumController,
                decoration: normalInput(hintText: 'Card Number'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: addrPayment.cholderController,
                decoration: normalInput(hintText: 'Card Holder'),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: addrPayment.dateController,
                      decoration: normalInput(hintText: 'Expiry Date'),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: textFieldDecoration,
                    child: TextField(
                      controller: addrPayment.cvvController,
                      decoration: normalInput(hintText: 'CVV'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Commonbutton(
                buttonText: 'Save and Pay',
                buttonfunction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
