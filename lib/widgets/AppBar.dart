// ignore_for_file: file_names

import 'package:ecommerce_app1/screens/cartscreen.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../screens/homescreen.dart';
import '../screens/notification.dart';
import '../models/product.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NormalAppBar({Key? key, required this.appTitle}) : super(key: key);
  final String appTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(appTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700)),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key, required this.appTitle}) : super(key: key);
  final String appTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text("Ecommerce App",
          style: TextStyle(color: AppColors.primaryColor)),
      elevation: 0.0,
      leading: IconButton(
        color: AppColors.primaryColor,
        icon: const Icon(Icons.menu),
        onPressed: () {
          z.toggle!();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: AppColors.primaryColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationPage()),
            );
          },
        ),
      ],
    );
  }
}

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final Product product;
  final Function(bool) onFavoriteChanged;

  const CustomAppBar1({
    required this.product,
    required this.onFavoriteChanged,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          iconSize: 25,
          icon: product.isFavorite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: AppColors.secondaryColor,
                ),
          onPressed: () {
            onFavoriteChanged(!product.isFavorite);
          },
        ),
      ],
    );
  }
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final Product product;
  const CustomAppBar2({Key? key, required this.product}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          iconSize: 25,
          icon: const Icon(Icons.shopping_cart_outlined,
              color: AppColors.secondaryColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
        ),
      ],
    );
  }
}


