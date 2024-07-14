import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/errors/messages.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/core/widgets/k_button_progress_indicator.dart';
import 'package:flutter/material.dart';

class KDropDownFieldBuilderWithTitle<T> extends StatelessWidget {
  final bool isLoading;
  final String title;
  final List<T>? items;
  final T? value;
  final ValueChanged onChanged;
  final Widget Function(T?) itemBuilder;
  final bool validatorActive;
  final FocusNode? focusNode;
  final String hintText;
  final int? maxLines;
  final int? minLines;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Widget? suffix;
  final String? prefixIconPath;
  final bool? obscureValue;
  final bool isBorder;
  final bool isEditable;

  const KDropDownFieldBuilderWithTitle({
    Key? key,
    this.isLoading = false,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemBuilder,
    this.validatorActive = true,
    this.focusNode,
    this.hintText = 'Select One',
    this.maxLines,
    this.minLines,
    this.inputType,
    this.inputAction,
    this.suffix,
    this.prefixIconPath,
    this.obscureValue,
    this.isBorder = true,
    this.isEditable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        const SizedBox(height: 8),
        isLoading
            ? Container(
                height: 56,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: kGrey,
                    width: 1,
                  ),
                ),
                child: const KButtonProgressIndicator(
                  indicatorColor: kPrimaryColor,
                ),
              )
            : DropdownButtonFormField(
                validator: (value) {
                  if (validatorActive && items?.contains(value) == false) {
                    return Message.emptyField;
                  }
                  return null;
                },
                elevation: 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
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
                  isDense: true,
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
                ),
                isDense: true,
                hint: Text(
                  hintText,
                  style: context.bodyLarge(),
                ),
                items: items
                    ?.map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: itemBuilder(item),
                      ),
                    )
                    .toList(),
                value: value,
                onChanged: isEditable ? onChanged : null,
                icon: SvgPicture.asset(
                  AssetPath.arrowForwardIcon,
                ),
              ),
        const SizedBox(height: 20),
      ],
    );
  }
}
