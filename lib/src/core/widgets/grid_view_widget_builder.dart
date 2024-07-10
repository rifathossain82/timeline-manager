import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';

class GridViewWidgetBuilder extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final EdgeInsetsGeometry padding;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double baseItemWidth;
  final int crossAxisCount;
  final bool isScrollable;
  final Color? bgColor;

  const GridViewWidgetBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding = const EdgeInsets.all(0),
    this.mainAxisSpacing = 15,
    this.crossAxisSpacing = 15,
    this.baseItemWidth = 100,
    this.crossAxisCount = 3,
    this.isScrollable = true,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double adjustedCrossAxisSpacing = (screenWidth - (crossAxisCount * baseItemWidth)) / crossAxisCount;
    if(adjustedCrossAxisSpacing < 0){
      adjustedCrossAxisSpacing = 0;
    }

    return Container(
      color: bgColor,
      child: MasonryGridView.count(
        padding: padding,
        shrinkWrap: isScrollable ? false : true,
        physics: isScrollable
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: adjustedCrossAxisSpacing,
        crossAxisCount: crossAxisCount,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
