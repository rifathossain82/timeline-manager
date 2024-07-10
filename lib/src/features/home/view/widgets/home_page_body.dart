import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/core/utils/layout_constants.dart';
import 'package:timeline_manager/src/core/widgets/grid_view_widget_builder.dart';
import 'package:timeline_manager/src/features/home/model/menu_item_model.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _UserCardWidget(),
          SizedBox(height: 16),
          _MenuItemsWidget(),
        ],
      ),
    );
  }
}

class _UserCardWidget extends StatelessWidget {
  const _UserCardWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.16),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AssetPath.person,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "মোঃ মোহাইমেনুল রেজা",
                  style: context.titleLarge(),
                ),
                Text(
                  "সফটবিডি লিমিটেড",
                  style: context.bodyLarge(),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetPath.locationIcon,
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "ঢাকা",
                      style: context.bodyLarge(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItemsWidget extends StatelessWidget {
  const _MenuItemsWidget();

  @override
  Widget build(BuildContext context) {
    const List<MenuItemModel> menuItems = [
      MenuItemModel(svgIconPath: AssetPath.menuIcon1, title: "মেনু নং\n০০০০১"),
      MenuItemModel(svgIconPath: AssetPath.menuIcon2, title: "মেনু নং\n০০০০২"),
      MenuItemModel(svgIconPath: AssetPath.menuIcon3, title: "মেনু নং\n০০০০৩"),
      MenuItemModel(svgIconPath: AssetPath.menuIcon4, title: "মেনু নং\n০০০০৪"),
      MenuItemModel(svgIconPath: AssetPath.menuIcon5, title: "মেনু নং\n০০০০৫"),
      MenuItemModel(svgIconPath: AssetPath.menuIcon6, title: "মেনু নং\n০০০০৬"),
    ];

    return GridViewWidgetBuilder(
      isScrollable: false,
      itemCount: menuItems.length,
      baseItemWidth: LayoutConstants.homepageMenuItemWidth,
      itemBuilder: (BuildContext context, int index) {
        return _MenuItem(menuItem: menuItems[index]);
      },
    );
  }
}

class _MenuItem extends StatelessWidget {
  final MenuItemModel menuItem;

  const _MenuItem({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: LayoutConstants.homepageMenuItemWidth,
          height: LayoutConstants.homepageMenuItemWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: menuBackgroundColor,
            borderRadius: BorderRadius.circular(7.2),
          ),
          child: SvgPicture.asset(
            menuItem.svgIconPath,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          menuItem.title,
          textAlign: TextAlign.center,
          style: context.titleMedium(),
        ),
      ],
    );
  }
}
