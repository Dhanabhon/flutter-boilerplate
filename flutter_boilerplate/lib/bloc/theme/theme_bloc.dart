import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/bloc/theme/theme_event.dart';
import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';
import 'package:flutter_boilerplate/config/theme.dart';
import 'package:flutter_boilerplate/services/local_storage.dart';
import 'package:flutter_boilerplate/utils/constants.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  final log = locator.get<AppLogger>();

  ThemeBloc() : super(CustomTheme.lightTheme) {
    on<InitializedTheme>((event, emit) async {
      if (await _isDarkMode()) {
        emit(CustomTheme.darkTheme);
      } else {
        emit(CustomTheme.lightTheme);
      }
    });

    on<SwitchedTheme>((event, emit) async {
      final isDarkTheme = state == CustomTheme.darkTheme;
      emit(isDarkTheme ? CustomTheme.lightTheme : CustomTheme.darkTheme);

      log.debug('[theme_bloc.dart][SwitchedTheme]: isDarkTheme: $isDarkTheme');

      _onSetTheme(isDarkTheme);
    });
  }

  Future<bool> _isDarkMode() async {
    final isDarkTheme = await getThemePreference();
    return (isDarkTheme == "dark") ? true : false;
  }

  Future<void> _onSetTheme(bool isDarkMode) async {
    final prefs = locator.get<LocalStorageService>();
    await prefs.saveDataToStorage(
        key: LocalStorageKey.themeMode,
        value: (isDarkMode == true) ? "dark" : "light");
  }

  Future<String?> getThemePreference() async {
    final prefs = locator.get<LocalStorageService>();
    return await prefs.readDataFromStorage(key: LocalStorageKey.themeMode);
  }
}
