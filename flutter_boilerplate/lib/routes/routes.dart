import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_boilerplate/screens/page_not_found/page_not_found.dart';
import 'package:flutter_boilerplate/screens/home/home.dart';
import 'package:flutter_boilerplate/screens/onboarding/onboarding.dart';
import 'package:flutter_boilerplate/screens/settings/settings.dart';

class AppRouter {
  static final _router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: Routes.onboardingPath,
    routes: [
      GoRoute(
        name: Routes.root,
        path: Routes.rootPath,
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
    redirect: (context, state) => null, // TODO: Add redirect based on something state.
    errorBuilder: (context, state) => NotFoundPage(error: state.error!.message),
  );

  static GoRouter get router => _router;
}

class Routes {
  static const root = 'home';
  static const rootPath = '/';
  static const settings = 'settings';
  static const settingsPath = '/settings';
  static const onboarding = 'onboarding';
  static const onboardingPath = '/onboarding';
}
