import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/images.dart';
import '../controllers/slider_provider.dart';
import '../models/product.dart';
import '../widgets/search_bar.dart' as CustomSearchBar;
import '../widgets/image_slider.dart';
import '../widgets/product_item.dart';

class TwoPanels extends StatelessWidget {
  final AnimationController controller;
  final ZoomDrawerController z;

  const TwoPanels({Key? key, required this.controller, required this.z}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderState(),
      child: _TwoPanelsContent(controller: controller, z: z),
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
      height: 120,
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
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(30),
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
          Image(image: AssetImage(data), width: 70, height: 70),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 14)),
        ],
      ),
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
              ),
              body: Scaffold(
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const CustomSearchBar.SearchBar(),
                      const SizedBox(height: 16),
                      _buildCategoryCards(),
                      const SizedBox(height: 16),
                      const ImageSlider(),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Choose the Product',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
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
          ],
        );
      },
    );
  }
}
