import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';

class AppBlocServer extends BlocObserver {
  final log = locator.get<AppLogger>();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log.debug('[AppBlocServer][onCreate]: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log.debug('[AppBlocServer][onChange]: ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.debug('[AppBlocServer][onError]: ${bloc.runtimeType}, $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log.debug('[AppBlocServer][onClose]: ${bloc.runtimeType}');
  }
}
