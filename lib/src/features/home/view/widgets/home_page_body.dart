import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/core/utils/layout_constants.dart';
import 'package:timeline_manager/src/core/widgets/grid_view_widget_builder.dart';
import 'package:timeline_manager/src/features/home/model/menu_item_model.dart';
import 'package:timeline_manager/src/features/home/view/widgets/circular_chart_painter.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _UserCardWidget(),
          SizedBox(height: 20),
          _TimeDurationWidget(),
          SizedBox(height: 20),
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "মোঃ মোহাইমেনুল রেজা",
                  style: context.titleLarge(),
                ),
                const SizedBox(height: 8),
                Text(
                  "সফটবিডি লিমিটেড",
                  style: context.bodyLarge(),
                ),
                const SizedBox(height: 4),
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

class _TimeDurationWidget extends StatelessWidget {
  const _TimeDurationWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const _CircularChart(
              percentage: 20,
              gradientColors: [
                gradiantColor2,
                gradiantColor1,
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "সময় অতিবাহিত",
              style: context.titleMedium(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        SizedBox(width: context.screenWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "মেয়াদকাল",
                style: context.titleMedium(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AssetPath.calendarOutlinedIcon,
                    height: 14,
                    width: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০",
                    maxLines: 1,
                    style: context.bodyMedium(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "আরও বাকি",
                style: context.titleMedium(
                  fontWeight: FontWeight.w700,
                  color: kRedLight,
                ),
              ),
              const SizedBox(height: 4),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _FormattedDateWidget(
                    value1: '০',
                    value2: '৫',
                    text: 'বছর',
                  ),
                  _FormattedDateWidget(
                    value1: '০',
                    value2: '৬',
                    text: 'মাস',
                  ),
                  _FormattedDateWidget(
                    value1: '১',
                    value2: '২',
                    text: 'দিন',
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _CircularChart extends StatelessWidget {
  final double percentage;
  final List<Color> gradientColors;

  const _CircularChart({
    required this.percentage,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(108, 108),
          painter: CircularChartPainter(
            percentage: percentage,
            gradientColors: gradientColors,
            backgroundColor: greyCardColor,
          ),
        ),
        Text(
          "৬ মাস ৬ দিন",
          style: context.titleSmall(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _FormattedDateWidget extends StatelessWidget {
  final String value1;
  final String value2;
  final String text;

  const _FormattedDateWidget({
    required this.value1,
    required this.value2,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DateNumberCardItem(value: value1),
            const SizedBox(width: 4),
            _DateNumberCardItem(value: value2),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: context.bodyMedium(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _DateNumberCardItem extends StatelessWidget {
  final String value;

  const _DateNumberCardItem({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: greyCardColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: kRedLight,
        ),
      ),
      child: Text(
        value,
        style: context.bodyMedium(
          fontWeight: FontWeight.w500,
        ),
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
