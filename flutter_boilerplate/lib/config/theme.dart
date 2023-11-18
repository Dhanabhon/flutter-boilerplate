import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/utils/constants.dart';

class CustomTheme {
  static bool useMaterial3 = true;
  static ColorSeed colorSelected = ColorSeed.baseColor;
  static ThemeMode themeMode = ThemeMode.system;

  static bool useLightMode(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  static final lightTheme = ThemeData(
    useMaterial3: useMaterial3,
    colorSchemeSeed: colorSelected.color,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    useMaterial3: useMaterial3,
    colorSchemeSeed: colorSelected.color,
    brightness: Brightness.dark,
  );

  // static final lightTheme = ThemeData(
  //   useMaterial3: useMaterial3,
  //   primaryColorLight: const Color(0xff486284),
  //   scaffoldBackgroundColor: const Color(0xffF5F5F6),
  //   buttonTheme: ButtonThemeData(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  //     buttonColor: const Color(0xff486284),
  //   ),
  // );

  // static final darkTheme = ThemeData(
  //   useMaterial3: useMaterial3,
  //   primaryColorDark: const Color(0xff151f3c),
  //   scaffoldBackgroundColor: const Color(0xffF5F5F6),
  //   buttonTheme: ButtonThemeData(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  //     buttonColor: const Color(0xff486284),
  //   ),
  // );

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
