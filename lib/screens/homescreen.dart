import 'package:flutter/material.dart';
import '../constants/images.dart';
import '../models/product.dart';
import '../widgets/image_slider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Product> products = [   ////controller
    Product(
      title: 'Product 1',
      description: 'Description of Product 1',
      image: Images.product1,
      price: 25.99,
    ),
    Product(
      title: 'Product 2',
      description: 'Description of Product 2',
      image: Images.product2,
      price: 19.99,
    ),
    Product(
      title: 'Product 3',
      description: 'Description of Product 2',
      image: Images.product2,
      price: 19.99,
    ),
    Product(
      title: 'Product 4',
      description: 'Description of Product 2',
      image: Images.product1,
      price: 19.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSearchBar(context),
            const SizedBox(height: 16),
            const ImageSlider(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Choose the Product',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductItem(product: products[index], imageSize: 100,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(                   ///comment
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
