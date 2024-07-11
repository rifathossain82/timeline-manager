import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/widgets/k_button.dart';

class DateAndButtonRowWidget extends StatelessWidget {
  final String dateText;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const DateAndButtonRowWidget({
    super.key,
    required this.dateText,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dateText,
          style: context.titleMedium(
            fontWeight: FontWeight.w700,
          ),
        ),
        KButton(
          width: 100,
          height: 29,
          borderRadius: 100,
          onPressed: onButtonPressed,
          child: Text(
            buttonText,
            style: context.buttonTextStyle(),
          ),
        ),
      ],
    );
  }
}
