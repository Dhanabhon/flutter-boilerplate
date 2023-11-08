import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/gen/assets.gen.dart';

class LanguageModel {
//   english(
//     Locale('en', 'US'),
//     // Assets.images.flags.unitedStatesOfAmerica,
//     'English',
//   ),
//   thai(
//     Locale('th', 'TH'),
//     // Assets.images.flags.thailand,
//     'Thai',
//   );

  final Locale locale;
  final AssetGenImage image;
  final String name;

  const LanguageModel(this.locale, this.image, this.name);
}
