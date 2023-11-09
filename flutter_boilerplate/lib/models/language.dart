import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/gen/assets.gen.dart';

class LanguageModel {
  final Locale locale;
  final AssetGenImage image;
  final String name;

  const LanguageModel(
      {required this.locale, required this.image, required this.name});

  static LanguageModel english = LanguageModel(
      locale: const Locale('en', 'US'),
      image: Assets.images.flags.unitedStatesOfAmerica,
      name: 'English');

  static LanguageModel thai = LanguageModel(
      locale: const Locale('th', 'TH'),
      image: Assets.images.flags.thailand,
      name: 'ภาษาไทย');

  static List<LanguageModel> values = [english, thai];
}
