import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteGenerator {
  static const String dashboard = '/';



  static final routes = [
    GetPage(
      name: RouteGenerator.dashboard,
      page: () => Container(),
    ),
  ];
}