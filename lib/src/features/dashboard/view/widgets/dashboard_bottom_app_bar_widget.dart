import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
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
      height: 75,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// Left side items
          ...items.take(items.length ~/ 2).map((item) => _BottomAppBarItem(
            item: item,
            onPressed: () => _onPressedItem(item.index),
            currentIndex: dashboardController.currentIndex.value,
          )),
          /// Spacer in the middle
          SizedBox(width: context.screenWidth * 0.05),
          /// Right side items
          ...items.skip(items.length ~/ 2).map((item) => _BottomAppBarItem(
            item: item,
            onPressed: () => _onPressedItem(item.index),
            currentIndex: dashboardController.currentIndex.value,
          )),
        ],
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
      height: 75,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              isSelected ? item.selectedIconPath : item.unselectedIconPath,
              colorFilter: const ColorFilter.mode(kBlackLight, BlendMode.srcIn),
              height: 24,
              width: 24,
            ),
            const SizedBox(height: 4),
            isSelected
                ? Container(
                    height: 4,
                    width: 4,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          gradiantColor1,
                          gradiantColor2,
                        ],
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 4,
                    width: 4,
                  ),
          ],
        ),
      ),
    );
  }
}
