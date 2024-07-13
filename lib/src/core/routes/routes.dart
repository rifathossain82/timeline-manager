import 'package:get/get.dart';
import 'package:timeline_manager/src/features/dashboard/view/pages/dashboad_page.dart';
import 'package:timeline_manager/src/features/timeline/view/pages/timeline_add_page.dart';

class RouteGenerator {
  static const String dashboard = '/';
  static const String addTimeline = '/add-timeline';

  static final routes = [
    GetPage(
      name: RouteGenerator.dashboard,
      page: () => const DashboardPage(),
    ),
    GetPage(
      name: RouteGenerator.addTimeline,
      page: () => const TimelineAddPage(),
    ),
  ];
}