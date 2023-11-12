import 'package:flutter/material.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    primaryColorLight: const Color(0xff486284),
    scaffoldBackgroundColor: const Color(0xffF5F5F6),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      buttonColor: const Color(0xff486284),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColorDark: const Color(0xff151f3c),
    scaffoldBackgroundColor: const Color(0xffF5F5F6),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      buttonColor: const Color(0xff486284),
    ),
  );

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
