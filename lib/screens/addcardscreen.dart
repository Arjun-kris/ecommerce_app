// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerce_app1/constants/button.dart';
import 'package:ecommerce_app1/constants/decoration.dart';
import 'package:ecommerce_app1/screens/listcarddetails.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/images.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../controllers/payment_provider.dart';
import '../models/card_details_model.dart';

class AddcardPage extends StatefulWidget {
  final Product? product;

  const AddcardPage({Key? key, this.product}) : super(key: key);

  @override
  _AddcardPageState createState() => _AddcardPageState();
}

class _AddcardPageState extends State<AddcardPage> {
  bool isChecked = false;

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900)),
          content: const Text('Card added successfully!', textAlign: TextAlign.center),
          actions: <Widget>[
            TextButton(
              child: const Align(alignment: Alignment.center, child: Text('OK', style: TextStyle(color: AppColors.primaryColor))),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Add Card'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.scale(
                origin: const Offset(0, 0),
                alignment: Alignment.topCenter,
                scale: 1.0,
                child: Image.asset(
                  Images.card,
                  fit: BoxFit.contain,
                  width: 600,
                  height: 300,
                ),
              ),
              Container(
                decoration: textFieldDecoration,
                child: TextField(
                  controller: AddrPayment.cnumController,
                  decoration: normalInput(hintText: 'Card Number'),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: textFieldDecoration,
                child: TextField(
                  controller: AddrPayment.cholderController,
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
                        controller: AddrPayment.dateController,
                        decoration: normalInput(hintText: 'Expiry Date'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: textFieldDecoration,
                      child: TextField(
                        controller: AddrPayment.cvvController,
                        decoration: normalInput(hintText: 'CVV'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text('Save this Card Details for future',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionalTranslation(
                  translation: const Offset(0.0, 0),
                  child: Commonbutton(
                    buttonText: 'Save and Pay',
                    buttonfunction: () {
                      if (isChecked) {
                        CardDetailsModel cardDetails = CardDetailsModel(
                          cardNumber: AddrPayment.cnumController.text,
                          cardHolder: AddrPayment.cholderController.text,
                          expiryDate: AddrPayment.dateController.text,
                          cvv: AddrPayment.cvvController.text,
                        );
                        cardDetailsList.add(cardDetails);
                        showSuccessDialog();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListCardDetails()),
                        );
                      } else {}
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
