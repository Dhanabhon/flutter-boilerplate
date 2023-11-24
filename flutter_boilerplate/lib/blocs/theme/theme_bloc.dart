import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/blocs/theme/theme_event.dart';
import 'package:flutter_boilerplate/configs/locator.dart';
import 'package:flutter_boilerplate/configs/theme.dart';
import 'package:flutter_boilerplate/services/local_storage.dart';
import 'package:flutter_boilerplate/utils/constants.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(CustomTheme.lightTheme) {
    on<InitializedTheme>((event, emit) async {
      $log.debug('[theme_bloc.dart][InitializedTheme]: Initializing...');

      if (await _isDarkMode()) {
        emit(CustomTheme.darkTheme);
      } else {
        emit(CustomTheme.lightTheme);
      }
    });

    on<SwitchedTheme>((event, emit) async {
      final isDarkTheme = state == CustomTheme.darkTheme;
      emit(isDarkTheme ? CustomTheme.lightTheme : CustomTheme.darkTheme);

      $log.debug('[theme_bloc.dart][SwitchedTheme]: isDarkTheme: $isDarkTheme');

      _onSetTheme(isDarkTheme);
    });
  }

  Future<bool> _isDarkMode() async {
    final isDarkTheme = await getThemePreference();
    final bool isDark;

    if (isDarkTheme == null) {
      Brightness brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;

      isDark = (brightness == Brightness.dark) ? true : false;
    } else {
      isDark = (isDarkTheme == "dark") ? true : false;
    }

    _onSetTheme(isDark);
    return isDark;
  }

  Future<void> _onSetTheme(bool isDarkMode) async {
    final prefs = locator.get<LocalStorageService>();
    await prefs.saveDataToStorage(
        key: LocalStorageKey.themeMode, value: (isDarkMode) ? "dark" : "light");
  }

  Future<String?> getThemePreference() async {
    final prefs = locator.get<LocalStorageService>();
    return await prefs.readDataFromStorage(key: LocalStorageKey.themeMode);
  }
}
