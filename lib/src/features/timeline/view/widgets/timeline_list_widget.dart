import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/core/widgets/failure_widget_builder.dart';
import 'package:timeline_manager/src/core/widgets/k_custom_loader.dart';
import 'package:timeline_manager/src/features/timeline/controller/timeline_controller.dart';
import 'package:timeline_manager/src/features/timeline/model/timeline_model.dart';

class TimelineListWidget extends StatelessWidget {
  const TimelineListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: context.screenWidth,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: secondaryCardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "আজকের কার্যক্রম",
              textAlign: TextAlign.start,
              style: context.titleMedium(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const _TimelineListView(),
          ],
        ),
      ),
    );
  }
}

class _TimelineListView extends StatelessWidget {
  const _TimelineListView();

  @override
  Widget build(BuildContext context) {
    final timelineController = Get.find<TimelineController>()
      ..getTimelineList();

    return Obx(() {
      return timelineController.isTimelineListLoading.value
          ? const KCustomLoader()
          : timelineController.timelineList.isEmpty
              ? const FailureWidgetBuilder()
              : Expanded(
                child: ListView.separated(
                    itemCount: timelineController.timelineList.length,
                    itemBuilder: (context, index) => _TimelineItemWidget(
                      index: index,
                      timeline: timelineController.timelineList[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
              );
    });
  }
}

class _TimelineItemWidget extends StatelessWidget {
  final int index;
  final TimelineModel timeline;

  const _TimelineItemWidget({
    required this.index,
    required this.timeline,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "সকাল\n১১:০০ মি.",
            textAlign: TextAlign.center,
            style: context.titleSmall(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.72),
              color: index.isOdd ? kBlackLight : null,
              gradient: index.isEven
                  ? const LinearGradient(
                      colors: [
                        gradiantColor1,
                        gradiantColor2,
                      ],
                    )
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetPath.clockCircleIcon,
                      height: 14,
                      width: 14,
                      colorFilter: const ColorFilter.mode(
                        secondaryCardColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "১১:০০ মি.",
                      style: context.bodyMedium(
                        fontWeight: FontWeight.w500,
                        color: secondaryCardColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  timeline.name ?? '',
                  style: context.titleSmall(
                    fontWeight: FontWeight.w600,
                    color: secondaryCardColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  timeline.category ?? '',
                  style: context.bodyMedium(
                    fontWeight: FontWeight.w500,
                    color: secondaryCardColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetPath.locationIcon,
                      height: 14,
                      width: 14,
                      colorFilter: const ColorFilter.mode(
                        secondaryCardColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      timeline.location ?? '',
                      style: context.bodyMedium(
                        fontWeight: FontWeight.w500,
                        color: secondaryCardColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
