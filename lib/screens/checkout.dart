import 'package:flutter/material.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../models/product.dart';
import '../models/addresses.dart';
import 'showaddress.dart'; // Import the ShowAddressPage

class CheckoutPage extends StatelessWidget {
  final Product product;

  const CheckoutPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstAddress = addresses.isNotEmpty ? addresses.first : null;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (firstAddress != null)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressPage(product: product,),
                    ),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            firstAddress.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            firstAddress.street,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${firstAddress.city}, ${firstAddress.state}, ${firstAddress.zipCode}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(product: product),
                  ),
                ); */
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                fixedSize: const Size(250, 50),
              ),
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
