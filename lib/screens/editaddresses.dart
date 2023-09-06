import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../constants/decoration.dart';
import '../controllers/address_provider.dart';
import '../models/addresses.dart';

class EditAddressPage extends StatefulWidget {
  final Address address;

  const EditAddressPage({required this.address, Key? key}) : super(key: key);

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  @override
  void initState() {
    addrText.nameController.text = widget.address.name;
    addrText.streetController.text = widget.address.street;
    addrText.cityController.text = widget.address.city;
    addrText.stateController.text = widget.address.state;
    addrText.zipCodeController.text = widget.address.zipCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title:
            const Text('Edit Address', style: TextStyle(color: Colors.black)),
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
                final updatedAddress = Address(
                  name: addrText.nameController.text,
                  street: addrText.streetController.text,
                  city: addrText.cityController.text,
                  state: addrText.stateController.text,
                  zipCode: addrText.zipCodeController.text,
                );

                final index = addresses.indexOf(widget.address);
                addresses[index] = updatedAddress;

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
                'Save Changes',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
