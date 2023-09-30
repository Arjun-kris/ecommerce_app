import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/screens/dashboard.dart';
import 'package:ecommerce_app1/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../constants/colors.dart';
import '../models/product.dart';
import '../widgets/AppBar.dart';
import '../widgets/StarRating.dart';
import '../widgets/bottomnavigation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 50,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      menuBackgroundColor: AppColors.primaryColor,
      mainScreen: CBody(),
      menuScreen: const DashboardScreen(),
    );
  }
}

class CBody extends StatelessWidget {
  CBody({super.key});

  final List<Product> cartProducts =
      products.where((product) => product.iscart).toList();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: const NormalAppBar(appTitle: 'Cart'),
          bottomNavigationBar: const Bottomnavigation(currentindex: 2),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const Floatingactionbutton(),
          body: Padding(
            padding: paddingall16,
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final cartProduct = cartProducts[index];
                return Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: [
                    IconSlideAction(
                      color: Colors.red,
                      icon: Icons.delete_outlined,
                      onTap: () {
                        cartProducts.removeAt(index);
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: AppColors.whiteColor,
                      elevation: 4,
                      child: Padding(
                        padding: paddingall10,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                cartProduct.images[0],
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartProduct.title,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '\$${cartProduct.price}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    StarRating(rating: cartProduct.rating),
                                  ],
                                ),
                              ),
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
        );
      },
    );
  }
}
