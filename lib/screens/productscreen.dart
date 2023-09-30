// ignore_for_file: library_private_types_in_public_api, avoid_types_as_parameter_names

import 'package:ecommerce_app1/constants/button.dart';
import 'package:ecommerce_app1/screens/checkout.dart';
import 'package:ecommerce_app1/screens/productdescription.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../widgets/AppBar.dart';
import '../widgets/StarRating.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _currentImageIndex = 0;
  bool isExpanded = false;
  bool isCart = false;

  @override
  void initState() {
    super.initState();
    isCart = widget.product.iscart;
  }

  final CarouselController _carouselController = CarouselController();

  List<String> sizes = ["Choose Size", "Small", "Medium", "Large", "XL"];
  String selectedSize = "Choose Size";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        product: widget.product,
        onFavoriteChanged: (bool newValue) {
          setState(() {
            widget.product.isFavorite = newValue;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 420.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
              ),
              items: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.product.images[index],
                    width: 395,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              height: 60,
              child: ListView.builder(
                itemCount: widget.product.images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        _carouselController.animateToPage(index);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentImageIndex == index
                                ? AppColors.primaryColor
                                : AppColors.transparentColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          widget.product.images[index],
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(4, -1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            StarRating(rating: widget.product.rating),
                            const SizedBox(width: 8),
                            Text('(${widget.product.reviews.length}+) Reviews'),
                          ],
                        ),
                        Text(
                          'Price: \$${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text('Colors:',
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 8),
                            Card(
                              elevation: 4,
                              child: Image.asset(
                                widget.product.images[0],
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Size:',
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            const SizedBox(height: 8),
                            DropdownButton<String>(
                              value: selectedSize,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedSize = newValue!;
                                });
                              },
                              items: sizes.map((String size) {
                                return DropdownMenuItem<String>(
                                  value: size,
                                  child: Text(size),
                                );
                              }).toList(),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Description:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: widget.product.description.length <= 100
                                ? '${widget.product.description}... '
                                : '${widget.product.description.substring(0, 100)}... ',
                            style: const TextStyle(fontSize: 15),
                          ),
                          if (widget.product.description.length > 100)
                            TextSpan(
                              text: 'Read more',
                              style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDescription(
                                          product: widget.product),
                                    ),
                                  );
                                },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Addcartbutton(
                buttonIcon: (isCart ? Icons.remove_shopping_cart_outlined : Icons.shopping_bag_outlined),
                buttonfunction: () {
                  setState(() {
                    isCart = !isCart;
                    widget.product.iscart = isCart;
                  });
                },
              ),
              Buynowbutton(
                buttonText: 'Buy Now',
                buttonfunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CheckoutPage(product: widget.product),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
