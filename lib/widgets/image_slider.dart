import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {  //controller
  int activeIndex = 0;
  final controller = CarouselController();
  final localImages = [
    'assets/images/offer1.png',
    'assets/images/offer2.png',
    'assets/images/offer3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: localImages.length,
          itemBuilder: (context, index, realIndex) {
            final localImage = localImages[index];
            return buildImage(localImage, index);
          },
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            autoPlay: true,
            enableInfiniteScroll: false,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),  ////change
          ),
        ),
        const SizedBox(height: 12),
        buildIndicator()
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
          dotWidth: 15,
          activeDotColor: Colors.blue,
        ),
        activeIndex: activeIndex,
        count: localImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildImage(String localImage, int index) => Image.asset(
        localImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
}
