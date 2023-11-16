import 'package:flutter/material.dart';

Locale localeResolution(
        List<Locale>? locales, Iterable<Locale> supportedLocales) =>
    (locales ?? []).firstWhere(
      (locale) => supportedLocales
          .any((supported) => supported.languageCode == locale.languageCode),
      orElse: () => const Locale('en'),
    );
