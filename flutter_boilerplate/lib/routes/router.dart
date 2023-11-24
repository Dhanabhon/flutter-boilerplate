import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/screens/app_scaffold.dart';
import 'package:flutter_boilerplate/screens/page_not_found/page_not_found.dart';
import 'package:flutter_boilerplate/screens/home/home.dart';
import 'package:flutter_boilerplate/screens/onboarding/onboarding.dart';
import 'package:flutter_boilerplate/screens/settings/settings.dart';

class Routes {
  static const splash = 'splash';
  static const splashPath = '/';
  static const home = 'home';
  static const homePath = '/home';
  static const settings = 'settings';
  static const settingsPath = '/settings';
  static const onboarding = 'onboarding';
  static const onboardingPath = '/onboarding';
}

class AppRouter {
  static final _router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    // initialLocation: Routes.onboardingPath,
    routes: [
      ShellRoute(
        builder: (context, router, navigator) {
          return AppScaffold(child: navigator);
        },
        routes: [
          AppRoute(
            Routes.splash,
            Routes.splashPath,
            (_) => Container(color: const Color(0xFF272625)),
          ),
          AppRoute(
            Routes.home,
            Routes.homePath,
            (_) => const HomePage(),
          ),
          AppRoute(
            Routes.settings,
            Routes.settingsPath,
            (_) => const SettingsPage(),
          ),
          AppRoute(
            Routes.onboarding,
            Routes.onboardingPath,
            (_) => const OnboardingPage(),
          ),
        ],
      ),
    ],
    redirect: _handleRedirect,
    errorBuilder: (context, state) => NotFoundPage(error: state.error!.message),
  );

  static GoRouter get router => _router;
}

class AppRoute extends GoRoute {
  AppRoute(String name, String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          name: name,
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );

  final bool useFade;
}

String? _handleRedirect(BuildContext context, GoRouterState state) {
  if (!appBootstrap.isBootstrapComplete &&
      state.uri.path != Routes.splashPath) {
    return Routes.splashPath;
  }

  $log.debug('[router.dart][_handleRedirect]: Navigate to: ${state.uri.path}');
  return null;
}
