import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/utils/constants.dart';

class CustomTheme {
  static bool useMaterial3 = true;
  static ColorSeed colorSelected = ColorSeed.baseColor;
  static ThemeMode themeMode = ThemeMode.system;

  static bool isLightMode(BuildContext context) {
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

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
