import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HouseViewStudentController extends GetxController {
  bool isLoad = false;
  final PageController _pageController = PageController(viewportFraction: 0.85);
  get pageController => _pageController;
  var currPageValue = 0.0;

  @override
  void onInit() {
    super.onInit();
    _pageController.addListener(() {
      currPageValue = _pageController.page!;
      print(currPageValue);
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
