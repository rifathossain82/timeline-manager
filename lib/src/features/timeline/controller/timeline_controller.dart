import 'package:get/get.dart';

class TimelineController extends GetxController {
  var dateList = <DateTime>[].obs;
  var selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime dateTime) {
    selectedDate.value = dateTime;
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
}
