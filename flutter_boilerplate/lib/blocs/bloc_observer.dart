import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';

class AppBlocServer extends BlocObserver {
  final log = locator.get<AppLogger>();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log.debug('[bloc_observer.dart][onCreate]: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log.debug('[bloc_observer.dart][onChange]: ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log.debug('[bloc_observer.dart][onTransition]: ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.debug('[bloc_observer.dart][onError]: ${bloc.runtimeType}, $error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log.debug('[bloc_observer.dart][onClose]: ${bloc.runtimeType}');
  }
}
