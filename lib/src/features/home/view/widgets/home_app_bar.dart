import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/layout_constants.dart';
import 'package:timeline_manager/src/core/widgets/main_app_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
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
              style: context.titleMedium(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(LayoutConstants.appBarHeight);
}
