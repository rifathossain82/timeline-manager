import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class KButton extends StatelessWidget {
  const KButton({
    super.key,
    this.onPressed,
    required this.child,
    this.borderRadius,
    this.height,
    this.width,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final double? borderRadius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.screenWidth,
      height: height ?? 42,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            gradiantColor1,
            gradiantColor2,
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
        color: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: child,
      ),
    );
  }
}
