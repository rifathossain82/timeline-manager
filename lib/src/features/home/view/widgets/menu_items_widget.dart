import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/core/utils/layout_constants.dart';
import 'package:timeline_manager/src/core/widgets/grid_view_widget_builder.dart';
import 'package:timeline_manager/src/features/home/model/menu_item_model.dart';

class MenuItemsWidget extends StatelessWidget {
  const MenuItemsWidget({super.key});

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