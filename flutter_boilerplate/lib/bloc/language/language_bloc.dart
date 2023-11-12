import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/services/local_storage.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/bloc/language/language_event.dart';
import 'package:flutter_boilerplate/bloc/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(Language.english)) {
    on<ChangedLanguage>(_onChangedLanguage);
  }

  Future<void> _onChangedLanguage(
      ChangedLanguage event, Emitter<LanguageState> emit) async {
    final savedLanguage = await getLanguagePreference();

    if (savedLanguage != null) {
      final language =
          savedLanguage == 'english' ? Language.english : Language.thai;

      saveLanguagePreference(language);
      emit(state);
    }
  }

  Future<String?> getLanguagePreference() async {
    final prefs = locator.get<LocalStorageService>();
    return await prefs.readDataFromStorage(key: LocalStorageKey.language);
  }

  Future<void> saveLanguagePreference(Language language) async {
    final prefs = locator.get<LocalStorageService>();
    await prefs.saveDataToStorage(
        key: LocalStorageKey.language,
        value: language == Language.english ? 'english' : 'thai');
  }
}
