import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;

  const TitleTextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 15,
        top: 8,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: context.appTextTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: kBlackLight,
          ),
        ),
      ),
    );
  }
}
