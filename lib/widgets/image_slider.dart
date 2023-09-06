import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants/colors.dart';
import '../controllers/slider_provider.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Consumer<SliderState>(builder: (context, sliderState, _) {
            return CarouselSlider.builder(
              carouselController: sliderState.controller,
              itemCount: sliderState.localImages.length,
              itemBuilder: (context, index, realIndex) {
                final localImage = sliderState.localImages[index];
                return buildImage(localImage, context);
              },
              options: CarouselOptions(
                viewportFraction: 0.999,
                enlargeFactor: 0.4,
                height: 150,
                aspectRatio: 24,
                autoPlay: true,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    sliderState.activeIndex = index,
              ),
            );
          }),
          const SizedBox(height: 12),
          Consumer<SliderState>(
           builder: (context, sliderState, _) {
             return AnimatedSmoothIndicator(
               onDotClicked: sliderState.animateToSlide,
               effect: const ScrollingDotsEffect(
                 dotHeight: 6,
                 dotWidth: 6,
                 activeDotColor: AppColors.secondaryColor,
               ),
               activeIndex: sliderState.activeIndex,
               count: sliderState.localImages.length,
             );
           },
         ),
        ],
      ),
    );
  }

  Widget buildImage(String localImage, BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          localImage,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
        ),
      );
}