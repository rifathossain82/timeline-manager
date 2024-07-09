import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:timeline_manager/src/features/dashboard/model/bottom_appbar_item_model.dart';
import 'package:timeline_manager/src/features/dashboard/view/widgets/dashboard_bottom_app_bar_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return Obx(
      () {
        return Scaffold(
          extendBody: true,
          body: dashboardController.currentPage,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              dashboardController.updateCurrentIndex(2);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: DashboardBottomAppBarWidget(
            dashboardController: dashboardController,
            items: [
              BottomAppBarItemModel(
                selectedIconPath: AssetPath.home,
                unselectedIconPath: AssetPath.homeOutlined,
                index: 0,
              ),
              BottomAppBarItemModel(
                selectedIconPath: AssetPath.calendar,
                unselectedIconPath: AssetPath.calendarOutlined,
                index: 1,
              ),
              BottomAppBarItemModel(
                selectedIconPath: AssetPath.historyList,
                unselectedIconPath: AssetPath.historyList,
                index: 3,
              ),
              BottomAppBarItemModel(
                selectedIconPath: AssetPath.profileOutlined,
                unselectedIconPath: AssetPath.profileOutlined,
                index: 4,
              ),
            ],
          ),
        );
      }
    );
  }
}
