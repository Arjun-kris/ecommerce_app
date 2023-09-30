import 'package:ecommerce_app1/constants/aligncontent.dart';
import 'package:ecommerce_app1/screens/checkout.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import '../constants/button.dart';
import '../models/product.dart';
import '../widgets/topnavigation.dart';

class ProductFeatures extends StatelessWidget {
  final Product product;
  const ProductFeatures({Key? key, required this.product}) : super(key: key);

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
                selectedIndex: 1,
                product: product,
              ),
              Image.asset(
                product.images[0],
              ),
              const SizedBox(height: 20),
              const Text('General', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              AlignContent(contentTitle: 'Model Name', contentText: product.modelname, product: product),
              const SizedBox(height: 20),
              AlignContent(contentTitle: 'Color', contentText: product.color, product: product),
              const SizedBox(height: 20),
              AlignContent(contentTitle: 'Type', contentText: product.tpass, product: product),
              const SizedBox(height: 20),
              AlignContent(contentTitle: 'Package', contentText: product.package, product: product),
              const SizedBox(height: 20),
              AlignContent(contentTitle: 'Design', contentText: product.design, product: product),
              const SizedBox(height: 20),
              const Text('Product Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              AlignContent(contentTitle: 'Sweat Proof', contentText: product.sweatproof, product: product),
              const SizedBox(height: 20),
              AlignContent(contentTitle: 'Water Proof', contentText: product.waterproof, product: product),
              const SizedBox(height: 20),
              AlignContent(contentTitle: 'Series', contentText: product.series, product: product),
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
