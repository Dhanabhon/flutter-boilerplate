import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/utils/platform_info.dart';
import 'package:flutter_boilerplate/routes/router.dart';

class AppBootstrap {
  bool isBootstrapComplete = false;

  Future<void> bootstrap() async {
    $log.debug('[bootstrap.dart][bootstrap]: Initializing...');

    // Set preferred refresh rate to the max possible
    if (PlatformInfo.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }

    isBootstrapComplete = true;

    AppRouter.router.go(Routes.onboardingPath);
  }
}
