import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/screens/accountdetails.dart';
import 'package:ecommerce_app1/screens/cartscreen.dart';
import 'package:ecommerce_app1/screens/category.dart';
import 'package:ecommerce_app1/screens/dashboard.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:ecommerce_app1/screens/offerscreen.dart';
import 'package:ecommerce_app1/screens/paymentscreen.dart';
import 'package:ecommerce_app1/screens/showaddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 50,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: AppColors.primaryColor,
      mainScreen: const cBody(),
      menuScreen: const DashboardScreen(),
    );
  }
}

class cBody extends StatelessWidget {
  const cBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text("Profile",
                    style: TextStyle(color: AppColors.primaryColor)),
                elevation: 0.0,
                leading: IconButton(
                  color: AppColors.primaryColor,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    z.toggle!();
                  },
                ),
              ),
              bottomNavigationBar: _buildBottomNavigationBar(context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.primaryColor,
                hoverElevation: 10,
                splashColor: Colors.grey,
                elevation: 4,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
                },
                child: const Icon(Icons.shopping_bag_sharp),
              ),
              
              body: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      _buildProfileCard(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildProfileCard(context) {
  return Padding(
    padding: profilecontain,
    child: Column(
      children: [
        const SizedBox(height: 16),
        Center(
          child: GestureDetector(
            onTap: () {
              _showImagePickerDialog(context);
            },
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                image: DecorationImage(
                  image: AssetImage(Images.logo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        _buildProfileDropdown1(context),
        _buildAddressDropdown(context),
        _buildPaymentDropdown(context),
        const SizedBox(height: 16),
      ],
    ),
  );
}

Future<void> _showImagePickerDialog(BuildContext context) async {
  final picker = ImagePicker();
  final pickedImage = await showDialog<PickedFile?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Pick an image from:"),
        actions: [
          TextButton(
            onPressed: () async {
              final pickedImage = await picker.pickImage(source: ImageSource.camera);
              Navigator.of(context).pop(pickedImage);
            },
            child: const Text("Camera"),
          ),
          TextButton(
            onPressed: () async {
              final pickedImage = await picker.pickImage(source: ImageSource.gallery);
              Navigator.of(context).pop(pickedImage);
            },
            child: const Text("Gallery"),
          ),
        ],
      );
    },
  );

  if (pickedImage != null) {
    // Handle the selected image file (update the profile picture)
    // You can use File(pickedImage.path) to get the image file.
    // Example: File imageFile = File(pickedImage.path);
  }
}

Widget _buildAddressDropdown(BuildContext context) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      title: const Text(
        'Address',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
      leading: const Icon(Icons.location_on_outlined,
          color: AppColors.primaryColor),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddressPage()),
        );
      },
    ),
  );
}

Widget _buildProfileDropdown1(BuildContext context) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      title: const Text(
        'Account Details',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
      leading:
          const Icon(Icons.person_2_outlined, color: AppColors.primaryColor),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return const AccountDetails();
          }),
        );
      },
    ),
  );
}

Widget _buildPaymentDropdown(BuildContext context) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      title: const Text(
        'Payment',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
      leading: const Icon(Icons.payment_outlined,
          color: AppColors.primaryColor),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaymentPage()),
        );
      },
    ),
  );
}


  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 0.01,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: AppColors.secondaryColor,
          selectedItemColor: AppColors.primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: '',
            ),
          ],
          currentIndex: 4,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OfferPage()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
