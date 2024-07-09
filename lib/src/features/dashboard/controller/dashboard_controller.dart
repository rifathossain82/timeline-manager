import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  final List<Widget> _pages = [
    const ColoredBox(color: Colors.blue),
    ColoredBox(color: Colors.blueGrey.shade900),
    const ColoredBox(color: Colors.orange),
    const ColoredBox(color: Colors.pink),
    const ColoredBox(color: Colors.green),
  ];

  Widget get currentPage => _pages[currentIndex.value];
}
