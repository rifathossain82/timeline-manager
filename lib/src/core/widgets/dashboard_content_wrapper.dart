import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class DashboardContentWrapper extends StatelessWidget {
  final Widget child;
  final bool showSecondaryBackground;

  const DashboardContentWrapper({
    super.key,
    required this.child,
    this.showSecondaryBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kScaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: kGreyLight,
            width: 1,
          ),
        ),
      ),
      child: showSecondaryBackground
          ? Container(
              margin: const EdgeInsets.all(15),
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: kGreyLight,
                  width: 1,
                ),
              ),
              child: child,
            )
          : child,
    );
  }
}
