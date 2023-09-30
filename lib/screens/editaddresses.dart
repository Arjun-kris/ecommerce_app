// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerce_app1/constants/button.dart';
import 'package:ecommerce_app1/constants/text_field.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../controllers/address_provider.dart';
import '../models/addresses.dart';
import '../widgets/AppBar.dart';

class EditAddressPage extends StatefulWidget {
  final Address address;

  const EditAddressPage({required this.address, Key? key}) : super(key: key);

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final AddressTypeController addressTypeController;

  _EditAddressPageState() : addressTypeController = AddressTypeController("");

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900)),
          content: const Text('Address updated successfully!', textAlign: TextAlign.center),
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
  void initState() {
    super.initState();
    AddrText.nameController.text = widget.address.name;
    AddrText.phoneController.text = widget.address.phone;
    AddrText.pincodeController.text = widget.address.pincode;
    AddrText.stateController.text = widget.address.state;
    AddrText.addressController.text = widget.address.address;
    AddrText.townController.text = widget.address.town;
    AddrText.cityController.text = widget.address.city;
    addressTypeController.selectedType.value = widget.address.addressType;
  }

  void handleSaveChanges() {
    final updatedAddress = Address(
      name: AddrText.nameController.text,
      phone: AddrText.phoneController.text,
      pincode: AddrText.pincodeController.text,
      state: AddrText.stateController.text,
      address: AddrText.addressController.text,
      town: AddrText.townController.text,
      city: AddrText.cityController.text,
      addressType: addressTypeController.selectedType.value,
    );

    final index = addresses.indexOf(widget.address);
    addresses[index] = updatedAddress;

    AddrText.nameController.clear();
    AddrText.phoneController.clear();
    AddrText.pincodeController.clear();
    AddrText.stateController.clear();
    AddrText.addressController.clear();
    AddrText.townController.clear();
    AddrText.cityController.clear();

    showSuccessDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Edit Address'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            editTextcontainer2(
                hintText: 'Name', tcontroller: AddrText.nameController),
            const SizedBox(height: 20),
            editTextcontainer2(
                hintText: 'Phone Number',
                tcontroller: AddrText.phoneController),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: editTextcontainer2(
                      hintText: 'Pincode',
                      tcontroller: AddrText.pincodeController),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: editTextcontainer2(
                      hintText: 'State',
                      tcontroller: AddrText.stateController),
                ),
              ],
            ),
            const SizedBox(height: 20),
            editTextcontainer2(
                hintText: 'Address', tcontroller: AddrText.addressController),
            const SizedBox(height: 20),
            editTextcontainer2(
                hintText: 'Locality/Town',
                tcontroller: AddrText.townController),
            const SizedBox(height: 20),
            editTextcontainer2(
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
            const SizedBox(height: 20),
            Endbutton(
              buttonText: 'Save Changes',
              buttonfunction: handleSaveChanges,
              offsetx: 0.0,
              offsety: 0.7,
            )
          ],
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
              groupValue: addressTypeController.selectedType.value,
              onChanged: (newValue) {
                addressTypeController.selectedType.value = newValue.toString();
              },
            ),
          ),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
