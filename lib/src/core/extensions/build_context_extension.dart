import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

extension BuildContextExtension on BuildContext {
  void unFocusKeyboard() {
    if (FocusScope.of(this).hasFocus) FocusScope.of(this).unfocus();
  }

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;

  double get minScreenSize =>
      min(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  double get maxScreenSize =>
      max(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  TextTheme get appTextTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  TextStyle? get buttonTextStyle =>
      Theme.of(this).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: kWhite,
            fontSize: 12,
          );

  TextStyle? get outlinedButtonTextStyle =>
      Theme.of(this).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: kPrimaryColor,
            fontSize: 12,
          );

  void openDrawer() => Scaffold.of(this).openDrawer();

  void closeDrawer() => Scaffold.of(this).closeDrawer();

  bool get isDrawerOpen => Scaffold.of(this).isDrawerOpen;
}
