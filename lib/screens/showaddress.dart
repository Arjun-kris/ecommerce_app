import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../models/product.dart';
import '../models/addresses.dart';
import '../screens/addaddresses.dart';
import '../screens/editaddresses.dart';

class AddressPage extends StatelessWidget {
  final Product? product;

  const AddressPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Shipping Address',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddAddressPage(),
                  ),
                );
              },
              child: const Text(
                '+ Add New Address',
                style: TextStyle(color: AppColors.secondaryColor, fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: [
                      IconSlideAction(
                        color: AppColors.primaryColor,
                        icon: Icons.edit_outlined,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditAddressPage(address: address)));
                        },
                      ),
                    ],
                    secondaryActions: [
                      IconSlideAction(
                        color: Colors.red,
                        icon: Icons.delete_outlined,
                        onTap: () {
                          addresses.removeAt(index);
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddressPage(product: product),
                            ),
                          );
                        },
                      ),
                    ],
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
                                address.name,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                address.street,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                '${address.city}, ${address.state}, ${address.zipCode}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
