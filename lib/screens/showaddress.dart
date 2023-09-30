import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ecommerce_app1/constants/colors.dart';
import '../models/product.dart';
import '../models/addresses.dart';
import '../screens/addaddresses.dart';
import '../screens/editaddresses.dart';
import '../controllers/address_provider.dart';
import '../widgets/AppBar.dart';

class AddressPage extends StatelessWidget {
  final Product? product;

  const AddressPage({Key? key, this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(appTitle: 'Address'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                AddrText.nameController.clear();
                AddrText.phoneController.clear();
                AddrText.pincodeController.clear();
                AddrText.stateController.clear();
                AddrText.addressController.clear();
                AddrText.townController.clear();
                AddrText.cityController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddAddressPage(),
                  ),
                );
              },
              child: const Text(
                '+ Add New Address',
                style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
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
                        foregroundColor: AppColors.whiteColor,
                        color: AppColors.primaryColor,
                        icon: Icons.edit_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditAddressPage(address: address),
                            ),
                          );
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
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${address.address}, ${address.town}, ${address.city}, ${address.state} - ${address.pincode}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                address.phone,
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
