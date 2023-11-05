
import 'package:flutter_boilerplate/bloc/language/language_state.dart';

abstract class LanguageEvent {}
class ChangedLanguage extends LanguageEvent {
  final Language language;
  ChangedLanguage(this.language);
}
