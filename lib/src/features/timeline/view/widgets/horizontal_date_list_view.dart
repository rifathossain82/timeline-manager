import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_manager/src/core/extensions/build_context_extension.dart';
import 'package:timeline_manager/src/core/extensions/date_time_extension.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/features/timeline/controller/timeline_controller.dart';

class HorizontalDateListView extends StatelessWidget {
  const HorizontalDateListView({super.key});

  @override
  Widget build(BuildContext context) {
    final timelineController = Get.find<TimelineController>()
      ..updateSelectedDate(DateTime.now())
      ..fetchDateListFrom7DaysAgoTo7DaysLater();

    return Obx(() {
      return Container(
        height: 105,
        width: context.screenWidth,
        alignment: Alignment.center,
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
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          itemCount: timelineController.dateList.length,
          itemBuilder: (context, index) => _DateItemWidget(
            timelineController: timelineController,
            dateTime: timelineController.dateList[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 16),
        ),
      );
    });
  }
}

class _DateItemWidget extends StatelessWidget {
  final TimelineController timelineController;
  final DateTime dateTime;

  const _DateItemWidget({
    required this.timelineController,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    List<String> values = dateTime.formatCurrentDateInBengaliToDateAndDateName;

    return Obx(() {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTapDateItem,
        child: Container(
          padding: const EdgeInsets.all(1.5),
          alignment: Alignment.center,
          decoration: _isSelected
              ? BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      gradiantColor1,
                      gradiantColor2,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                )
              : const BoxDecoration(),
          child: Container(
            decoration: BoxDecoration(
              color: _isSelected ? kWhite : Colors.transparent,
              borderRadius: BorderRadius.circular(100.0),
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.all(1.5),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  values.first,
                  style: context.bodyLarge(),
                ),
                const SizedBox(height: 12),
                Text(
                  values.last,
                  style: context.titleMedium(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _onTapDateItem(){
    timelineController.updateSelectedDate(dateTime);
    timelineController.getTimelineList();
  }

  bool get _isSelected =>
      dateTime.day == timelineController.selectedDate.value.day;
}
