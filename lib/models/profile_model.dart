import 'dart:io';

class ProfileModel {
  String name;
  String email;
  String phone;
  String password;
  File? imageFile;

  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.imageFile,
  });
}

final List<ProfileModel> profilemodel = [
  ProfileModel(
    name: 'John Doe',
    phone: '1234567890',
    email: 'abc123@gmail.com',
    password: '123456',
    imageFile: File('assets/profile_images/profile.jpg'),
  ),
];
