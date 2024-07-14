import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Returns the date and time in 'dd MMM yyyy, hh:mm AM/PM' format in Bengali.
  String get formattedDateTimeInBengali {
    final formattedDate = DateFormat('dd MMMM yyyy, hh:mm a', 'bn').format(this);

    /// Convert English numerals to Bengali numerals
    String formattedBanglaDate = _convertToBengaliNumeral(formattedDate);

    /// Replace AM/PM with their Bengali equivalents
    String finalOutput =
        formattedBanglaDate.replaceAll('AM', 'এএম').replaceAll('PM', 'পিএম');

    return finalOutput;
  }

  String get formatCurrentDateInBengaliToDMMMM {
    const bengaliLocale = 'bn';

    /// Format the date in Bengali
    final day = DateFormat.d(bengaliLocale).format(this);
    final month = DateFormat.MMMM(bengaliLocale).format(this);

    /// Convert the formatted date to Bengali numerals
    final bengaliDay =
        day.split('').map((e) => _convertToBengaliNumeral(e)).join();
    final bengaliMonth = month;

    return '$bengaliDay $bengaliMonth';
  }

  List<String> get formatCurrentDateInBengaliToDateAndDateName {
    const bengaliLocale = 'bn';

    /// Format the date in Bengali
    final day = DateFormat.d(bengaliLocale).format(this);

    /// Convert the formatted date to Bengali numerals
    final bengaliDay =
        day.split('').map((e) => _convertToBengaliNumeral(e)).join();

    return [_convertToBengaliShortDayName(weekday.toString()), bengaliDay];
  }

  String get _timeOfDayCategory {
    final hour = this.hour;
    String timeCategory = "";

    if (hour >= 0 && hour < 6) {
      timeCategory = "রাত"; // 12:00 AM to 5:59 AM
    } else if (hour < 12) {
      timeCategory = "সকাল"; // 6:00 AM to 11:59 AM
    } else if (hour < 18) {
      timeCategory = "দুপুর"; // 12:00 PM to 5:59 PM
    } else {
      timeCategory = "সন্ধ্যা"; // 6:00 PM to 11:59 PM
    }

    return timeCategory;
  }

  String get formattedTimeOfDayWithCategory {
    final hour = this.hour;

    String formattedHour = hour
        .toString()
        .split('')
        .map((e) => _convertToBengaliNumeral(e))
        .join()
        .padLeft(2, '০');

    String formattedMinute = minute
        .toString()
        .split('')
        .map((e) => _convertToBengaliNumeral(e))
        .join()
        .padLeft(2, '০');

    return "$_timeOfDayCategory\n$formattedHour:$formattedMinute মি.";
  }

  String get formattedTimeOfDay {
    final hour = this.hour;

    String formattedHour = hour
        .toString()
        .split('')
        .map((e) => _convertToBengaliNumeral(e))
        .join()
        .padLeft(2, '০');

    String formattedMinute = minute
        .toString()
        .split('')
        .map((e) => _convertToBengaliNumeral(e))
        .join()
        .padLeft(2, '০');

    return "$formattedHour:$formattedMinute মি.";
  }

  String _convertToBengaliNumeral(String number) {
    const englishToBengali = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };
    return englishToBengali[number] ?? number;
  }

  String _convertToBengaliShortDayName(String number) {
    const englishToBengali = {
      '1': 'সোম',
      '2': 'মঙ্গল',
      '3': 'বুধ',
      '4': 'বৃহঃ',
      '5': 'শুক্র',
      '6': 'শনি',
      '7': 'রবি',
    };
    return englishToBengali[number] ?? number;
  }
}
