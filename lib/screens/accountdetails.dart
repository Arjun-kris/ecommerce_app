
// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/constants/button.dart';
import 'package:ecommerce_app1/constants/text_field.dart';
import 'package:ecommerce_app1/models/profile_model.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../constants/decoration.dart';
import '../constants/icons.dart';
import '../controllers/profile_provider.dart';

class AccountDetails extends StatefulWidget {
  final ProfileModel? profileModel;
  

  const AccountDetails({Key? key, this.profileModel}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  String? selectedOption;
  bool isPasswordVisible = false;
  bool isRetypePasswordVisible = false;
  File? _selectedImage;
  
  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900)),
          content: const Text('Account updated successfully!', textAlign: TextAlign.center),
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

  Future<void> saveProfileImage() async {
    final updatedProfileModel = ProfileModel(
      name: AddrText.nameController.text,
      phone: AddrText.phoneController.text,
      email: AddrText.emailController.text,
      password: AddrText.passwordController.text,
      imageFile: _selectedImage
    );

    final index = profilemodel.indexOf(widget.profileModel!);
    profilemodel[index] = updatedProfileModel;

    AddrText.nameController.clear();
    AddrText.phoneController.clear();
    AddrText.emailController.clear();
    AddrText.passwordController.clear();

    showSuccessDialog();
  }

  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> openCameraPicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    AddrText.nameController.text = widget.profileModel!.name;
    AddrText.emailController.text = widget.profileModel!.email;
    AddrText.phoneController.text = widget.profileModel!.phone;
    AddrText.passwordController.text = widget.profileModel!.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Account Details'),
      body: Padding(
        padding: profilecontain,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            imageProfile(),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topCenter,
              child: Text(widget.profileModel?.name ?? '',
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w900)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRadioButton("Mr", "mr"),
                const SizedBox(width: 40),
                buildRadioButton("Mrs", "mrs"),
                const SizedBox(width: 40),
                buildRadioButton("Other", "other"),
              ],
            ),
            const SizedBox(height: 20),
            editTextcontainer(
                hintText: 'Phone',
                tcontroller: AddrText.phoneController,
                prefix: const Icon(AppIcons.phone)),
            const SizedBox(height: 20),
            editTextcontainer(
                hintText: 'Name',
                tcontroller: AddrText.nameController,
                prefix: const Icon(AppIcons.name)),
            const SizedBox(height: 20),
            editTextcontainer(
                hintText: 'Email',
                tcontroller: AddrText.emailController,
                prefix: const Icon(AppIcons.email)),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: AddrText.passwordController,
                obscureText: !isPasswordVisible,
                decoration: passswordInput(
                  hintText: 'Password',
                  prefixIcon:
                      const Icon(AppIcons.lock, color: AppColors.primaryColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: textFieldDecoration,
              child: TextField(
                controller: AddrText.passwordController,
                obscureText: !isRetypePasswordVisible,
                decoration: passswordInput(
                  hintText: 'Re-type Password',
                  prefixIcon:
                      const Icon(AppIcons.lock, color: AppColors.primaryColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isRetypePasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isRetypePasswordVisible = !isRetypePasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Endbutton(
              buttonText: 'Update Information',
              buttonfunction: () {
                saveProfileImage();
              },
              offsetx: 0.0,
              offsety: 0.7,
            ),
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

  Widget imageProfile() {
  return GestureDetector(
    onTap: () {
      showImageBottomSheet(context);
    },
    child: Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
          image: DecorationImage(
                image: AssetImage('assets/profile_images/profile.jpg'),
                fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            if (_selectedImage != null)
              CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(_selectedImage!),
              ),
            const Align(
              alignment: Alignment.bottomRight,
              child: AppIcons.camera,
            ),
          ],
        ),
      ),
    ),
  );
}

  void showImageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Choose Profile photo",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  openCameraPicker();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  openImagePicker();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

