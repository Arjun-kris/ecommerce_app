import 'package:ecommerce_app1/screens/cartscreen.dart';
import 'package:ecommerce_app1/screens/category.dart';
import 'package:ecommerce_app1/screens/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../controllers/slider_provider.dart';
import '../models/product.dart';
import '../screens/homescreen.dart';
import '../screens/notification.dart';
import '../screens/offerscreen.dart';
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

class _TwoPanelsContent extends StatelessWidget {
  final AnimationController controller;
  final ZoomDrawerController z;

  const _TwoPanelsContent({Key? key, required this.controller, required this.z})
      : super(key: key);

  Widget _buildCategoryCards() {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryCard('Phones', Images.phones),
          _buildCategoryCard('Shoes', Images.shoes),
          _buildCategoryCard('Smartwatches', Images.watches),
          _buildCategoryCard('Accessories', Images.accessories),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String data) {
    return Column(
      children: [
        Container(
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.1),
            border: Border.all(
              color: AppColors.secondaryColor
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(data),
                  width: 70,
                  height: 70,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Scaffold(
              extendBodyBehindAppBar: true,
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
                    z.toggle!();
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
                            builder: (context) => const NotificationPage()),
                      );
                    },
                  ),
                ],
              ),
              bottomNavigationBar: _buildBottomNavigationBar(context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.primaryColor,
                hoverElevation: 10,
                splashColor: Colors.grey,
                elevation: 4,
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
                },
                child: const Icon(Icons.shopping_bag_sharp),
              ),
              
              body: Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const CustomSearchBar.SearchBar(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              _buildCategoryCards(),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.90,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return ProductItem(product: products[index]);
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

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 0.00,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: AppColors.secondaryColor,
          selectedItemColor: AppColors.primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: '',
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OfferPage()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
                break;
            }
          },
        ),
      ),
    );
  }

}
