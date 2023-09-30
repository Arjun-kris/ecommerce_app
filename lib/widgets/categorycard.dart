import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/images.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryCard('Phones', Images.phones),
          _buildCategoryCard('Shoes', Images.shoes),
          _buildCategoryCard('Smartwatches', Images.watches),
          _buildCategoryCard('Accessories', Images.accessories),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String data) {
    return Column(
      children: [
        Container(
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.1),
            border: Border.all(
              color: AppColors.secondaryColor
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(data),
                  width: 70,
                  height: 70,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
