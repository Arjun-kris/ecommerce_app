import 'dart:io';

import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ProfileModelProvider with ChangeNotifier {
  ProfileModel? _profile;

  ProfileModel? get profile => _profile;

  void saveProfile(ProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }
}

class ImageProvider with ChangeNotifier {
  File? _imageFile;

  File? get imageFile => _imageFile;

  void setImageFile(File? file) {
    _imageFile = file;
    notifyListeners();
  }
}

class AddrText {
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneController = TextEditingController();
  static final passwordController = TextEditingController();
}
