import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../models/profile_model.dart';
import '../screens/cartscreen.dart';
import '../screens/category.dart';
import '../screens/homescreen.dart';
import '../screens/offerscreen.dart';
import '../screens/profilescreen.dart';

class Bottomnavigation extends StatelessWidget {
  const Bottomnavigation({Key? key, required this.currentindex})
      : super(key: key);
  final int currentindex;

  @override
  Widget build(BuildContext context) {
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
          currentIndex: currentindex,
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
                  MaterialPageRoute(builder: (context) => ProfilePage(profilemodel: profilemodel[0]))
                );
            }
          },
        ),
      ),
    );
  }
}

class Floatingactionbutton extends StatelessWidget {
  const Floatingactionbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
