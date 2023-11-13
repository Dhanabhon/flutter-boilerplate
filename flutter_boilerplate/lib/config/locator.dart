import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_boilerplate/config/logger.dart';
import 'package:flutter_boilerplate/routes/routes.dart';
import 'package:flutter_boilerplate/services/local_storage.dart';
import 'package:flutter_boilerplate/bloc/theme/theme_bloc.dart';

// Set up dependency injection
final GetIt locator = GetIt.I;

Future<void> setupLocator() async {
  locator.registerLazySingleton<GoRouter>(() => AppRouter.router);

  locator.registerSingleton<AppLogger>(AppLogger());
  locator.registerSingleton<LocalStorageService>(LocalStorageService());

  locator.registerFactory<ThemeBloc>(() => ThemeBloc());
}
