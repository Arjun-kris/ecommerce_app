import 'package:ecommerce_app1/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app1/controllers/slider_provider.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<SliderState>(
          builder: (context, sliderState, _) {
            return CarouselSlider.builder(
              carouselController: sliderState.controller,
              itemCount: sliderState.localImages.length,
              itemBuilder: (context, index, realIndex) {
                final localImage = sliderState.localImages[index];
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
                    sliderState.activeIndex = index,
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Consumer<SliderState>(
          builder: (context, sliderState, _) {
            return AnimatedSmoothIndicator(
              onDotClicked: sliderState.animateToSlide,
              effect: const ExpandingDotsEffect(
                dotHeight: 6,
                dotWidth: 6,
                activeDotColor: AppColors.primaryColor,
              ),
              activeIndex: sliderState.activeIndex,
              count: sliderState.localImages.length,
            );
          },
        ),
      ],
    );
  }

  Widget buildImage(String localImage, int index) => Image.asset(
        localImage,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );
}
