import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class InitializedTheme extends ThemeEvent {}

class SwitchedTheme extends ThemeEvent {}
