import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class KDivider extends StatelessWidget {
  final double? height;
  final Color? color;
  const KDivider({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 10,
      color: color ?? kDividerColor,
    );
  }
}
