import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timeline_manager/src/features/home/view/pages/home_page.dart';
import 'package:timeline_manager/src/features/timeline/view/pages/timeline_page.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  final List<Widget> _pages = [
    const Homepage(),
    const TimelinePage(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  Widget get currentPage => _pages[currentIndex.value];
}
