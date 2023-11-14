import 'package:equatable/equatable.dart';

import 'package:flutter_boilerplate/bloc/language/language_state.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class ChangedLanguage extends LanguageEvent {
  const ChangedLanguage({required this.selectedLanguage});

  final Language selectedLanguage;

  @override
  List<Object?> get props => [selectedLanguage];
}
