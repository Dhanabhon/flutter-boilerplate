import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';

import 'package:flutter_boilerplate/config/logger.dart';
import 'package:flutter_boilerplate/routes/routes.dart';

// Set up dependency injection
final GetIt locator = GetIt.I;

Future<void> setupLocator() async {
  locator.registerLazySingleton<GoRouter>(() => AppRouter.router);
  locator.registerLazySingleton<AppLogger>(() => AppLogger());
}