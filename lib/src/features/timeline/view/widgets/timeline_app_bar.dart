import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/layout_constants.dart';
import 'package:timeline_manager/src/core/widgets/main_app_bar.dart';

class TimelineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TimelineAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MainAppBar(
      centerTitle: true,
      title: Text(
        "সময়রেখা",
        style: context.titleMedium(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(LayoutConstants.appBarHeight);
}
