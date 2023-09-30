import 'package:flutter/material.dart';

class AddrText {
  static final nameController = TextEditingController();
  static final phoneController = TextEditingController();
  static final pincodeController = TextEditingController();
  static final stateController = TextEditingController();
  static final addressController = TextEditingController();
  static final townController = TextEditingController();
  static final cityController = TextEditingController();
  
}

class AddressTypeController {
  final ValueNotifier<String> selectedType;

  AddressTypeController(String initialType) : selectedType = ValueNotifier<String>(initialType);
}




