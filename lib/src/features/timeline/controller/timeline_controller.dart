import 'package:get/get.dart';
import 'package:timeline_manager/src/core/helpers/logger.dart';
import 'package:timeline_manager/src/core/network/api.dart';
import 'package:timeline_manager/src/core/network/network_utils.dart';
import 'package:timeline_manager/src/core/services/snack_bar_services.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/features/timeline/model/timeline_model.dart';

class TimelineController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var dateList = <DateTime>[].obs;
  var isTimelineListLoading = false.obs;
  var timelineList = <TimelineModel>[].obs;

  void updateSelectedDate(DateTime dateTime) {
    selectedDate.value = dateTime;
    getTimelineList();
  }

  void fetchDateListFrom7DaysAgoTo7DaysLater() {
    dateList.value = [];
    final now = DateTime.now();
    const int daysToFetch = 7;

    /// Fetch dates from 7 days ago to 7 days later
    for (int i = -daysToFetch; i <= daysToFetch; i++) {
      final DateTime date = now.add(Duration(days: i));
      dateList.add(date);
    }
  }

  Future<void> getTimelineList() async {
    try {
      isTimelineListLoading(true);
      timelineList.value = [];

      dynamic responseBody = await Network.handleResponse(
        await Network.getRequest(
          api: Api.timelineList,
        ),
      );

      if (responseBody != null) {
        timelineList.value = (responseBody['data'] as List)
            .map((item) => TimelineModel.fromJson(item))
            .toList();
      }

      timelineList.value = timelineList
          .where((timeline) =>
              timeline.date != null &&
              timeline.date!.day == selectedDate.value.day)
          .toList();

      Log.info('Get ${timelineList.length} items!');

    } catch (e, stackTrace) {
      Log.error('$e', stackTrace: stackTrace);

      SnackBarService.showSnackBar(
        message: '$e',
        bgColor: failedColor,
      );
    } finally {
      isTimelineListLoading(false);
    }
  }
}
