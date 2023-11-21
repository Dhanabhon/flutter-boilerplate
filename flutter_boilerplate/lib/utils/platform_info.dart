import 'package:flutter/foundation.dart';

class PlatformInfo {
  static const _desktopPlatoforms = [
    TargetPlatform.linux,
    TargetPlatform.macOS,
    TargetPlatform.windows
  ];

  static const _mobilePlatforms = [
    TargetPlatform.android,
    TargetPlatform.iOS,
    TargetPlatform.fuchsia
  ];

  static bool get isDesktop =>
      _desktopPlatoforms.contains(defaultTargetPlatform) && !kIsWeb;
  static bool get isDesktopOrWeb => isDesktop || kIsWeb;
  static bool get isMobile =>
      _mobilePlatforms.contains(defaultTargetPlatform) && !kIsWeb;

  static bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;
  static bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isFuchsia => defaultTargetPlatform == TargetPlatform.fuchsia;
}
