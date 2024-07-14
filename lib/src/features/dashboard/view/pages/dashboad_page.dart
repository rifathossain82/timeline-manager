import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:timeline_manager/src/features/dashboard/model/bottom_appbar_item_model.dart';
import 'package:timeline_manager/src/features/dashboard/view/widgets/dashboard_bottom_app_bar_widget.dart';
import 'package:timeline_manager/src/features/dashboard/view/widgets/dashboard_floating_action_button.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return Obx(() {
      return Scaffold(
        body: dashboardController.currentPage,
        floatingActionButton: DashboardFloatingActionButton(
          dashboardController: dashboardController,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: DashboardBottomAppBarWidget(
          dashboardController: dashboardController,
          items: [
            BottomAppBarItemModel(
              selectedIconPath: AssetPath.homeIcon,
              unselectedIconPath: AssetPath.homeOutlinedIcon,
              index: 0,
            ),
            BottomAppBarItemModel(
              selectedIconPath: AssetPath.calendarIcon,
              unselectedIconPath: AssetPath.calendarOutlinedIcon,
              index: 1,
            ),
            BottomAppBarItemModel(
              selectedIconPath: AssetPath.historyIcon,
              unselectedIconPath: AssetPath.historyIcon,
              index: 3,
            ),
            BottomAppBarItemModel(
              selectedIconPath: AssetPath.accountOutlinedIcon,
              unselectedIconPath: AssetPath.accountOutlinedIcon,
              index: 4,
            ),
          ],
        ),
      );
    });
  }
}
