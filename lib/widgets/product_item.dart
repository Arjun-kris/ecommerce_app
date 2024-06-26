// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/productscreen.dart';
import '../constants/colors.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final Function(bool) onFavoriteChanged;

  const ProductItem(
      {required this.product, required this.onFavoriteChanged, Key? key})
      : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: widget.product),
          ),
        );
      },
      child: Card(
        color: AppColors.accentColor,
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 10.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 4.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      iconSize: 25,
                      icon: widget.product.isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: AppColors.secondaryColor,
                            ),
                      onPressed: () {
                        widget.onFavoriteChanged(!widget.product.isFavorite);
                      },
                    ),
                  ),
                ),
                Center(
                  child: Image.asset(
                    widget.product.images[0],
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: const TextStyle(
                          fontSize: 12.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
