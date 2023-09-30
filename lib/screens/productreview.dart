import 'package:ecommerce_app1/constants/colors.dart';
import 'package:ecommerce_app1/screens/checkout.dart';
import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import '../constants/Padding.dart';
import '../constants/button.dart';
import '../constants/images.dart';
import '../models/product.dart';
import '../widgets/topnavigation.dart';

class ProductReview extends StatelessWidget {
  final Product product;
  const ProductReview({Key? key, required this.product}) : super(key: key);

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
                selectedIndex: 2,
                product: product,
              ),
              Image.asset(
                product.images[0],
              ),
              const SizedBox(height: 20),
              const Text('Reviews',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: product.reviews.length,
                itemBuilder: (context, index) {
                  final review = product.reviews[index];
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: paddingall10,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  Images.logo,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.username,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        review.comment,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                review.date,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
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
