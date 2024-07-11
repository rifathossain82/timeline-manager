import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatCurrentDateInBengaliToDMMMM {
    const bengaliLocale = 'bn';

    /// Format the date in Bengali
    final day = DateFormat.d(bengaliLocale).format(this);
    final month = DateFormat.MMMM(bengaliLocale).format(this);

    /// Convert the formatted date to Bengali numerals
    final bengaliDay = day.split('').map((e) => _convertToBengaliNumeral(e)).join();
    final bengaliMonth = month;

    return '$bengaliDay $bengaliMonth';
  }

  List<String> get formatCurrentDateInBengaliToDateAndDateName {
    const bengaliLocale = 'bn';

    /// Format the date in Bengali
    final day = DateFormat.d(bengaliLocale).format(this);
    final dayName = DateFormat.d().format(this);

    /// Convert the formatted date to Bengali numerals
    final bengaliDay = day.split('').map((e) => _convertToBengaliNumeral(e)).join();

    return [_convertToBengaliShortDayName(weekday.toString()), bengaliDay];
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
