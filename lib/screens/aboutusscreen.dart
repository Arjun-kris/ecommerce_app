import 'package:ecommerce_app1/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import '../constants/Padding.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NormalAppBar(appTitle: 'About Us'),
      body: Padding(
        padding: profilecontain,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec sapien sit amet quam auctor hendrerit. Integer posuere, orci vel tristique dapibus, erat nisl luctus purus, eu congue eros metus eu metus. Vivamus fermentum libero et arcu fringilla, vel semper urna feugiat. Proin eu tellus a lectus pharetra tincidunt non id velit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla facilisi.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.normal
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
