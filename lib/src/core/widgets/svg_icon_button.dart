import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class SvgIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String svgIconPath;
  final double? size;
  final Color? color;

  const SvgIconButton({
    super.key,
    this.onTap,
    required this.svgIconPath,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SvgPicture.asset(
        svgIconPath,
        alignment: Alignment.center,
        width: size ?? 20,
        height: size ?? 20,
        color: color ?? kPrimaryColor,
      ),
    );
  }
}
