// ignore_for_file: library_prefixes

import 'package:ecommerce_app1/constants/Padding.dart';
import 'package:ecommerce_app1/models/product.dart';
import 'package:ecommerce_app1/widgets/categorycard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../controllers/slider_provider.dart';
import '../screens/notification.dart';
import '../widgets/bottomnavigation.dart';
import '../widgets/search_bar.dart' as CustomSearchBar;
import '../widgets/image_slider.dart';
import '../widgets/product_item.dart';

class TwoPanels extends StatelessWidget {
  final AnimationController controller;
  final ZoomDrawerController z;

  const TwoPanels({Key? key, required this.controller, required this.z})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderState(),
      child: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) =>
                _TwoPanelsContent(controller: controller, z: z),
          );
        },
      ),
    );
  }
}

class _TwoPanelsContent extends StatefulWidget {
  final AnimationController controller;
  final ZoomDrawerController z;

  const _TwoPanelsContent({Key? key, required this.controller, required this.z})
      : super(key: key);
      
        get product => Product;

  @override
  _TwoPanelsContentState createState() => _TwoPanelsContentState();
}

class _TwoPanelsContentState extends State<_TwoPanelsContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text("Ecommerce App",
                    style: TextStyle(color: AppColors.primaryColor)),
                elevation: 0.0,
                leading: IconButton(
                  color: AppColors.primaryColor,
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    widget.z.toggle!();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications,
                        color: AppColors.primaryColor),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ));
                    },
                  ),
                ],
              ),
              bottomNavigationBar: const Bottomnavigation(currentindex: 0),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: const Floatingactionbutton(),
              body: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const CustomSearchBar.SearchBar(),
                        const Padding(
                          padding: profilecontain,
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              CategoryCard(),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: p1,
                          child: ImageSlider(),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Choose Product',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: paddingall8,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.90,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return ProductItem(
                                product: products[index],
                                onFavoriteChanged: (bool newValue) {
                                  setState(() {
                                    widget.product.isFavorite = newValue;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
