import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/bloc/theme/theme_event.dart';
import 'package:flutter_boilerplate/config/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(CustomTheme.lightTheme) {
    on<InitializedTheme>((event, emit) async {});

    on<SwitchedTheme>((event, emit) async {});
  }

  Future<bool> _isDarkMode() async {
    // TODO:
    return false;
  }

  Future<void> _onSetTheme(bool isDarkMode) async {
    // TODO:
    if (isDarkMode) {

    } else {

    }
  }
}
