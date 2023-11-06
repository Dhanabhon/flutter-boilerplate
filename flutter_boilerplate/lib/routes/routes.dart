import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/settings/settings.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_boilerplate/screens/page_not_found/page_not_found.dart';
import 'package:flutter_boilerplate/screens/home/home.dart';

class AppRouter {
  static const root = '/';
  static const settings = '/settings';

  static final _router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: root,
    routes: [
      GoRoute(
        path: root,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: settings,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
    errorBuilder: (context, state) => NotFoundPage(error: state.error!.message),
  );

  static GoRouter get router => _router;
}
