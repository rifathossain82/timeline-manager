import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/features/dashboard/controller/dashboard_controller.dart';

class DashboardFloatingActionButton extends StatelessWidget {
  final DashboardController dashboardController;

  const DashboardFloatingActionButton({
    super.key,
    required this.dashboardController,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        dashboardController.updateCurrentIndex(2);
      },
      child: Container(
        height: 56,
        width: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              gradiantColor1,
              gradiantColor2,
            ],
          ),
        ),
        child: SvgPicture.asset(
          AssetPath.cameraOutlinedIcon,
          colorFilter: ColorFilter.mode(kWhite, BlendMode.srcIn),
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}
