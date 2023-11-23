import 'package:flutter/material.dart';

class AppStyle {
  AppStyle({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1.0;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = 0.9; // phone
    } else {
      scale = 0.85; // small phone
    }
  }

  late final double scale;

  late final _Text text = _Text(scale);
}

@immutable
class _Text {
  _Text(this._scale);

  final double _scale;

  final Map<String, TextStyle> _fonts = {
    'en': const TextStyle(fontFamily: 'Noto'),
    'th': const TextStyle(fontFamily: 'Noto')
  };

  TextStyle get titleFont => _fonts.entries.first.value;
  TextStyle get quoteFont => _fonts.entries.first.value;
  TextStyle get wonderTitleFont => _fonts.entries.first.value;
  TextStyle get contentFont => _fonts.entries.first.value;

  late final TextStyle dropCase =
      _createFont(quoteFont, sizePx: 56, heightPx: 20);

  late final TextStyle appTitle =
      _createFont(titleFont, sizePx: 64, heightPx: 56);

  late final TextStyle h1 = _createFont(titleFont, sizePx: 64, heightPx: 62);
  late final TextStyle h2 = _createFont(titleFont, sizePx: 32, heightPx: 46);
  late final TextStyle h3 =
      _createFont(titleFont, sizePx: 24, heightPx: 36, weight: FontWeight.w600);
  late final TextStyle h4 = _createFont(contentFont,
      sizePx: 14, heightPx: 23, spacingPc: 5, weight: FontWeight.w600);

  late final TextStyle title1 =
      _createFont(titleFont, sizePx: 16, heightPx: 26, spacingPc: 5);
  late final TextStyle title2 =
      _createFont(titleFont, sizePx: 14, heightPx: 16.38);

  late final TextStyle body =
      _createFont(contentFont, sizePx: 16, heightPx: 26);
  late final TextStyle bodyBold = _createFont(contentFont,
      sizePx: 16, heightPx: 26, weight: FontWeight.w600);
  late final TextStyle bodySmall =
      _createFont(contentFont, sizePx: 14, heightPx: 23);
  late final TextStyle bodySmallBold = _createFont(contentFont,
      sizePx: 14, heightPx: 23, weight: FontWeight.w600);

  TextStyle _createFont(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    sizePx *= _scale;
    if (heightPx != null) {
      heightPx *= _scale;
    }
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight);
  }
}
