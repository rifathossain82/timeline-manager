import 'package:get/get.dart';
import 'package:timeline_manager/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:timeline_manager/src/features/timeline/controller/timeline_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => TimelineController(), fenix: true);
  }
}
