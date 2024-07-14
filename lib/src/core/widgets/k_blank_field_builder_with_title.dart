import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:flutter/material.dart';

class KBlankFieldBuilderWithTitle extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback? onTap;
  final bool hasValidator;

  const KBlankFieldBuilderWithTitle({
    Key? key,
    required this.title,
    required this.content,
    this.onTap,
    this.hasValidator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: context.titleMedium(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            height: 48,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 0.85,
                color: kTextFieldBorderColor,
              ),
            ),
            child: content,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}