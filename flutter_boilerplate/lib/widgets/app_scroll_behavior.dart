import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_boilerplate/utils/platform_info.dart';

class AppScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    final devices = Set<PointerDeviceKind>.from(super.dragDevices);
    devices.add(PointerDeviceKind.mouse);
    return devices;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return PlatformInfo.isAndroid
        ? RawScrollbar(controller: details.controller, child: child)
        : CupertinoScrollbar(controller: details.controller, child: child);
  }
}
