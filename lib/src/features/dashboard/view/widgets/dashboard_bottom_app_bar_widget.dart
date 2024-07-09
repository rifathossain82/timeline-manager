import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:timeline_manager/src/features/dashboard/model/bottom_appbar_item_model.dart';

class DashboardBottomAppBarWidget extends StatelessWidget {
  final List<BottomAppBarItemModel> items;
  final DashboardController dashboardController;

  const DashboardBottomAppBarWidget({
    super.key,
    required this.items,
    required this.dashboardController,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) => _BottomAppBarItem(
          item: item,
          onPressed: () => _onPressedItem(item.index),
          currentIndex: dashboardController.currentIndex.value,
        )).toList(),
      ),
    );
  }

  void _onPressedItem(int index) {
    dashboardController.updateCurrentIndex(index);
  }
}

class _BottomAppBarItem extends StatelessWidget {
  final BottomAppBarItemModel item;
  final VoidCallback onPressed;
  final int currentIndex;

  const _BottomAppBarItem({
    required this.item,
    required this.onPressed,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = currentIndex == item.index;
    return SizedBox(
      height: 60,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              isSelected ? item.selectedIconPath : item.unselectedIconPath,
              color: kBlackLight,
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
