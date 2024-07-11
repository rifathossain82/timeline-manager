import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/core/utils/layout_constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool centerTitle;

  const MainAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: SvgPicture.asset(
          AssetPath.menuIcon,
          height: 24,
          width: 24,
        ),
      ),
      titleSpacing: 0,
      title: title,
      actions: [
        Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.only(
            right: 15,
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kGreyLight,
          ),
          child: SvgPicture.asset(
            AssetPath.notificationIcon,
            height: 24,
            width: 24,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(LayoutConstants.appBarHeight);
}
