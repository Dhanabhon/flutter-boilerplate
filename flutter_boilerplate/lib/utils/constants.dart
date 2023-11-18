import 'package:flutter/material.dart';

class LocalStorageKey {
  static const language = 'language';
  static const onboarding = 'onboarding';
  static const themeMode = 'themeMode';
  static const getStarted = 'getStarted';
}

// Theme Colors
enum ColorSeed {
  baseColor('M3 Baseline', Color(0xff6750a4)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}
