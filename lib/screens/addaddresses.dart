import 'package:ecommerce_app1/constants/text_field.dart';
import 'package:ecommerce_app1/screens/showaddress.dart';
import 'package:ecommerce_app1/utils/success_utils.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../constants/button.dart';
import '../controllers/address_provider.dart';
import '../models/addresses.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  String? selectedOption;
  final successUtils = SuccessUtils();

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900)),
          content: const Text('Address added successfully!', textAlign: TextAlign.center),
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddressPage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title:
              const Text('Add Address', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              editTextcontainer3(
                  hintText: 'Name', tcontroller: AddrText.nameController),
              const SizedBox(height: 20),
              editTextcontainer3(
                  hintText: 'Phone Number',
                  tcontroller: AddrText.phoneController),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: editTextcontainer3(
                        hintText: 'Pincode',
                        tcontroller: AddrText.pincodeController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: editTextcontainer3(
                        hintText: 'State',
                        tcontroller: AddrText.stateController),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              editTextcontainer3(
                  hintText: 'Address', tcontroller: AddrText.addressController),
              const SizedBox(height: 20),
              editTextcontainer3(
                  hintText: 'Locality/Town',
                  tcontroller: AddrText.townController),
              const SizedBox(height: 20),
              editTextcontainer3(
                  hintText: 'City/District',
                  tcontroller: AddrText.cityController),
              const SizedBox(height: 30),
              const Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text('Types of Address', style: TextStyle(fontSize: 16))),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildRadioButton("Home", "Home"),
                  const SizedBox(width: 40),
                  buildRadioButton("Work", "Work"),
                ],
              ),
              const SizedBox(height: 60),
              Commonbutton(
                buttonText: 'Save Address',
                buttonfunction: () {
                  final newAddress = Address(
                    name: AddrText.nameController.text,
                    phone: AddrText.phoneController.text,
                    pincode: AddrText.pincodeController.text,
                    state: AddrText.stateController.text,
                    address: AddrText.addressController.text,
                    town: AddrText.townController.text,
                    city: AddrText.cityController.text,
                    addressType: selectedOption ?? "",
                  );
                  addresses.add(newAddress);
                  AddrText.nameController.clear();
                  AddrText.phoneController.clear();
                  AddrText.pincodeController.clear();
                  AddrText.stateController.clear();
                  AddrText.addressController.clear();
                  AddrText.townController.clear();
                  AddrText.cityController.clear();

                  showSuccessDialog();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(String title, String value) {
    return SizedBox(
      child: Row(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Radio(
              activeColor: AppColors.primaryColor,
              value: value,
              groupValue: selectedOption,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue.toString();
                });
              },
            ),
          ),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
