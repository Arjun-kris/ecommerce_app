// ignore_for_file: library_private_types_in_public_api

import 'package:ecommerce_app1/screens/dashboard.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/colors.dart';
import '../widgets/AppBar.dart';
import '../models/product.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 50,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: AppColors.primaryColor,
      mainScreen: const CBody(),
      menuScreen: const DashboardScreen(),
    );
  }
}


class CBody extends StatefulWidget {
  const CBody({Key? key}) : super(key: key);

  @override
  _CBodyState createState() => _CBodyState();
}

class _CBodyState extends State<CBody> {

  @override
  Widget build(BuildContext context) {
    final favoriteProducts =
        products.where((product) => product.isFavorite).toList();

    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Wishlist'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18.0,
            mainAxisSpacing: 18.0,
          ),
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoriteProducts[index];
            return ProductCard(
              product: product,
              onFavoriteChanged: (bool newValue) {
                setState(() {
                  product.isFavorite = newValue;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(bool) onFavoriteChanged;

  const ProductCard(
      {super.key, required this.product, required this.onFavoriteChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4.0,
          child: SizedBox(
            height: 120,
            width: 150,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 12,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
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
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    product.images[0],
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: const TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 13.0),
            ),
          ],
        ),
      ],
    );
  }
}
