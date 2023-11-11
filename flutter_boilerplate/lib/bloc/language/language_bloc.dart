import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_boilerplate/bloc/language/language_event.dart';
import 'package:flutter_boilerplate/bloc/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(Language.english)) {
    on<ChangedLanguage>(_onChangedLanguage);
    on<GetLanguage>(_onGetLanguage);
  }

  Future<void> _onChangedLanguage(
      ChangedLanguage event, Emitter<LanguageState> emit) async {
    // final prefs = await SharedPreferences.getInstance();
    // final savedLanguage = prefs.getString('language');

    // final prefs = await LocalStorageService.getInstance();
    final prefs = locator.get<LocalStorageService>();


    if (savedLanguage != null) {
      final language =
          savedLanguage == 'english' ? Language.english : Language.thai;

      saveLanguagePreference(language);
      emit(state.copyWith(event.language));
    }
  }

  Future<void> _onGetLanguage(
      GetLanguage event, Emitter<LanguageState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final language = prefs.getString('language');

    emit(state.copyWith(
      language != null ? 
      Language.values
      .where((item) => item.value.lan)));
  }

  Future<void> saveLanguagePreference(Language language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'language', language == Language.english ? 'english' : 'thai');
  }
}
