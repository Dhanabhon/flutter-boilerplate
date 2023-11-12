import 'package:equatable/equatable.dart';

import 'package:flutter_boilerplate/bloc/language/language_state.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class ChangedLanguage extends LanguageEvent {
  final Language language;
  const ChangedLanguage(this.language);

  @override
  List<Object?> get props => [language];
}
