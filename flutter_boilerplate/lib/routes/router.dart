import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

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
    initialLocation: Routes.onboardingPath,
    routes: [
      ShellRoute(
        builder: (context, router, navigator) {
          return AppScaffold(child: navigator);
        },
        routes: [
          GoRoute(
            name: Routes.home,
            path: Routes.homePath,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: Routes.settings,
            path: Routes.settingsPath,
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            name: Routes.onboarding,
            path: Routes.onboardingPath,
            builder: (context, state) => const OnboardingPage(),
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
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
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
  // TODO: handle something!
  return null;
}
