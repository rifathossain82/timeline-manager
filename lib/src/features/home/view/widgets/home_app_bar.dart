import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      title: Row(
        children: [
          Image.asset(
            AssetPath.appLogo,
            height: 37,
            width: 37,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Flutter Task",
              textAlign: TextAlign.start,
              style: context.appTextTheme.bodyLarge?.copyWith(
                color: kBlackLight,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Container(
          height: 35,
          width: 35,
          margin: const EdgeInsets.only(
            right: 15,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
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
  Size get preferredSize => const Size.fromHeight(60);
}
