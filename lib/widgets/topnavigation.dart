// ignore_for_file: must_be_immutable

import 'package:ecommerce_app1/constants/colors.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/productdescription.dart';
import '../screens/productfeatures.dart';
import '../screens/productreview.dart';

class TopNavigationBar extends StatelessWidget {
  final Product product;
  List<String> options = ['Description', 'Features', 'Reviews'];
  final int selectedIndex;

  TopNavigationBar({super.key, 
    required this.product,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Row(
          children: List.generate(options.length, (index) {
            final isSelected = index == selectedIndex;
            return Expanded(
              child: TextButton(
                onPressed: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDescription(product: product),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductFeatures(product: product),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductReview(product: product),
                        ),
                      );
                      break;
                  }
                },
                child: Text(
                  options[index],
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
        Positioned(
          bottom: 0,
          left: (MediaQuery.of(context).size.width / options.length) * selectedIndex,
          child: Container(
            width: MediaQuery.of(context).size.width / options.length,
            height: 2,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
