import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';

class FailureWidgetBuilder extends StatelessWidget {
  final String? svgIconPath;
  final String? title;
  final double? height;
  final double? width;

  const FailureWidgetBuilder({
    super.key,
    this.svgIconPath,
    this.title,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgIconPath ?? AssetPath.noDataFoundIcon,
                height: context.screenHeight * 0.27,
                width: context.screenWidth,
                alignment: Alignment.center,
              ),
              Text(
                title ?? 'No Data Found!',
                style: context.bodyMedium(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
