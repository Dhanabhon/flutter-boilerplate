import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/bloc/language/language_event.dart';
import 'package:flutter_boilerplate/bloc/language/language_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(Language.english)) {
    loadSavedLanguage();
    on<ChangedLanguage>(_onChangedLanguage as EventHandler<ChangedLanguage, LanguageState>);
  }

  void loadSavedLanguage() {
    // on<ChangedLanguage>(_onChangedLanguage);
  }

  Future<void> _onChangedLanguage(
      ChangedLanguage event, Emitter<Language> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language');

    if (savedLanguage != null) {
      final language =
          savedLanguage == 'english' ? Language.english : Language.thai;

      saveLanguagePreference(language);
      emit(language);
    }
  }

  Future<void> saveLanguagePreference(Language language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'language', language == Language.english ? 'english' : 'thai');
  }
}
