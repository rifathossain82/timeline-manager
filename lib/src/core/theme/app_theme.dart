import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    primarySwatch: kPrimarySwatchColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kWhite,
      foregroundColor: kBlackLight,
      elevation: 0,
      titleTextStyle: GoogleFonts.notoSerifBengali(
        fontSize: 16,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,

        /// Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (light icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
      foregroundColor: kWhite,
    ),
    textTheme: GoogleFonts.notoSerifBengaliTextTheme(Typography.blackCupertino),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(kPrimaryColor),
      checkColor: MaterialStatePropertyAll(kWhite),
      side: BorderSide(color: kGrey),
    ),
    cardTheme: CardTheme(
      color: kWhite,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    iconTheme: IconThemeData(
      color: kGrey,
    ),
  );


  static void setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static void setLightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // For Android (light icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static void enableInitialThemeSetting(){
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// to hide top and bottom, both status bar
  static void hideStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }
}