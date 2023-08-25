import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../constants/decoration.dart';
import '../controllers/address_provider.dart';
import '../models/addresses.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Add Address', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: addrText.nameController,
                decoration: normalInput(hintText: 'Name'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: addrText.streetController,
                decoration: normalInput(hintText: 'Street'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: addrText.cityController,
                decoration: normalInput(hintText: 'City'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: addrText.stateController,
                decoration: normalInput(hintText: 'State'),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: addrText.zipCodeController,
                decoration: normalInput(hintText: 'Zip Code'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newAddress = Address(
                  name: addrText.nameController.text,
                  street: addrText.streetController.text,
                  city: addrText.cityController.text,
                  state: addrText.stateController.text,
                  zipCode: addrText.zipCodeController.text,
                );
                addresses.add(newAddress);
                addrText.nameController.clear();
                addrText.streetController.clear();
                addrText.cityController.clear();
                addrText.stateController.clear();
                addrText.zipCodeController.clear();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                fixedSize: const Size(250, 50),
              ),
              child: const Text(
                'Save Address',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

