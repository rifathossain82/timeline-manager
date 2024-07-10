import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timeline_manager/src/features/dashboard/view/pages/dashboad_page.dart';

class RouteGenerator {
  static const String dashboard = '/';

  static final routes = [
    GetPage(
      name: RouteGenerator.dashboard,
      page: () => const DashboardPage(),
    ),
  ];
}