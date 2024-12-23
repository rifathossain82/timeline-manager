import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class KTextFormFieldBuilderWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final String? hintText;
  final String? secondaryHitText;
  final FocusNode? focusNode;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final int maxLine;
  final int minLine;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool readOnly;
  final bool obscureText;
  final double bottomPadding;

  const KTextFormFieldBuilderWithTitle({
    Key? key,
    required this.title,
    this.controller,
    this.validator,
    this.hintText,
    this.secondaryHitText,
    this.focusNode,
    this.prefixIconPath,
    this.suffixIconPath,
    this.maxLine = 1,
    this.minLine = 1,
    this.onChanged,
    this.onTap,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.bottomPadding = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: context.titleMedium(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (secondaryHitText != null)
              Text(
                secondaryHitText ?? '',
                textAlign: TextAlign.end,
                style: context.bodyLarge(),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          maxLines: maxLine,
          minLines: minLine,
          keyboardType: inputType,
          textInputAction: inputAction,
          textAlign: TextAlign.start,
          readOnly: readOnly,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.bodyLarge(),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            filled: true,
            fillColor: secondaryCardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: kTextFieldBorderColor,
                width: 0.85,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: kTextFieldBorderColor,
                width: 0.85,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: kTextFieldBorderColor,
                width: 0.85,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 50,
              maxHeight: 50,
              minHeight: 14,
              minWidth: 14,
            ),
            prefixIcon: prefixIconPath != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 12,
                    ),
                    child: SvgPicture.asset(
                      prefixIconPath!,
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                      colorFilter: const ColorFilter.mode(
                        kGreyTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            suffixIconConstraints: const BoxConstraints(
              maxWidth: 50,
              maxHeight: 50,
              minHeight: 14,
              minWidth: 14,
            ),
            suffixIcon: suffixIconPath != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: SvgPicture.asset(
                      suffixIconPath!,
                      height: 11,
                      width: 11,
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                      colorFilter: const ColorFilter.mode(
                        kGreyTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        SizedBox(height: bottomPadding),
      ],
    );
  }
}
