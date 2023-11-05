import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_boilerplate/screens/page_not_found/page_not_found.dart';
import 'package:flutter_boilerplate/screens/home/home.dart';

final appRoutes = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
  ],
  errorBuilder: (context, state) => NotFoundPage(error: state.error!.message),
);
