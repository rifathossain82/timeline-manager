import 'package:get/get.dart';
import 'package:timeline_manager/src/core/routes/navigation_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => NavigationController(), fenix: true);
  }
}
