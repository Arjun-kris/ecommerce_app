import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/screens/checkout.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import '../constants/button.dart';
import '../constants/text_field_styles.dart';
import '../models/product.dart';
import '../widgets/topnavigation.dart';


class ProductDescription extends StatelessWidget {
  final Product product;
  const ProductDescription({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(product: product),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              TopNavigationBar(
                selectedIndex: 0,
                product: product,
              ),
              Image.asset(
                product.images[0],
              ),
              const Text('Description',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Text(
                product.description,
                style: descript
              ),
              const SizedBox(height: 23),
              const Text('Highlights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: product.highlights.map((highlight) {
                  return Padding(
                    padding: top8,
                    child: Text(
                      '• $highlight',
                      style: descript,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 60),
              Endbutton(
                buttonText: 'Buy Now',
                buttonfunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(product: product),
                    ),
                  );
                },
                offsetx: 0.0,
                offsety: 0.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
