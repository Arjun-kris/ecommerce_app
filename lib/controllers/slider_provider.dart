import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class SliderState with ChangeNotifier {
  int _activeIndex = 0;
  final CarouselController _controller = CarouselController();
  final List<String> _localImages = [
    'assets/images/offer1.png',
    'assets/images/offer2.png',
    'assets/images/offer3.png',
  ];

  int get activeIndex => _activeIndex;
  CarouselController get controller => _controller;
  List<String> get localImages => _localImages;

  set activeIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  void animateToSlide(int index) {
    _controller.animateToPage(index);
  }
}
