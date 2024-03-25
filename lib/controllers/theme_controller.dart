import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';

class ThemeController {
  bool isDarkMode = false;
  ThemeData? selectedThemeData;

  static ThemeData lightTheme = ThemeData(
    fontFamily: NeetAssets.defaultFont,
    dividerColor: ColorConstants.appLightBlack,
    scaffoldBackgroundColor: ColorConstants.appWhite,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorConstants.appWhite,
      ),
      displayMedium: TextStyle(
        color: ColorConstants.appBlack,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: ColorConstants.appBlack,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      headlineMedium: TextStyle(
        color: ColorConstants.appBlack,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: ColorConstants.appBlack,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: ColorConstants.appBlack,
        fontSize: 11,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: ColorConstants.appLightBlack,
        fontWeight: FontWeight.w600,
        fontSize: 9,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        shadowColor:
            MaterialStateProperty.all(ColorConstants.appTransparent),
      ),
    ),
    splashFactory: NoSplash.splashFactory,
    drawerTheme: const DrawerThemeData(backgroundColor: ColorConstants.appWhite),
    iconTheme: const IconThemeData(color: ColorConstants.appWhite, size: 20),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: NeetAssets.defaultFont,
    dividerColor: ColorConstants.appWhite,
    scaffoldBackgroundColor: ColorConstants.appBlack,
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorConstants.appWhite,
      ),
      displayMedium: const TextStyle(
        color: ColorConstants.appWhite,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: const TextStyle(
        color: ColorConstants.appWhite,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      headlineMedium: const TextStyle(
        color: ColorConstants.appWhite,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: const TextStyle(
        color: ColorConstants.appWhite,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: const TextStyle(
        color: ColorConstants.appWhite,
        fontSize: 11,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: ColorConstants.appWhite.withOpacity(0.8),
        fontWeight: FontWeight.w700,
        fontSize: 9,
      ),
    ),
    splashFactory: NoSplash.splashFactory,
    drawerTheme: const DrawerThemeData(backgroundColor: ColorConstants.appLightBlack),
    iconTheme: const IconThemeData(color: ColorConstants.appWhite, size: 20),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(ColorConstants.appRed),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        shadowColor:
            MaterialStateProperty.all(ColorConstants.appTransparent),
      ),
    ),
  );

ThemeController() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    isDarkMode = brightness == Brightness.dark;
    selectedThemeData = isDarkMode ? darkTheme : lightTheme;
    checkTheme();
  }

  void swapTheme({Brightness? brightness}) async {
    if (brightness == null) {
      selectedThemeData =
          selectedThemeData == lightTheme ? darkTheme : lightTheme;
    } else {
      isDarkMode = brightness == Brightness.dark;
      selectedThemeData = isDarkMode ? darkTheme : lightTheme;
    }
    isDarkMode = selectedThemeData == lightTheme ? false : true;
  }

  void checkTheme() async {
    // if (await checkPrefKey(isTheme)) {
    //   isDarkMode = (await getPrefBoolValue(isTheme))!;
    //   selectedThemeData = isDarkMode ? darkTheme : lightTheme;
    //   notifyListeners();
    // }
  }
}
