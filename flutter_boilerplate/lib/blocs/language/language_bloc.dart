import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';
import 'package:flutter_boilerplate/services/local_storage.dart';
import 'package:flutter_boilerplate/utils/constants.dart';
import 'package:flutter_boilerplate/blocs/language/language_event.dart';
import 'package:flutter_boilerplate/blocs/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangedLanguage>(_onChangedLanguage);
    on<GetLanguage>(_onGetLanguage);
  }

  final log = locator.get<AppLogger>();

  Future<void> _onChangedLanguage(
      ChangedLanguage event, Emitter<LanguageState> emit) async {
    final currentLanguage = event.selectedLanguage;
    final previousLanguage = await getLanguagePreference();

    if (currentLanguage == previousLanguage) {
      log.debug(
          '[language_bloc.dart][_onChangedLanguage]: The current language is the same as the previous language.');
      return;
    }

    await saveLanguagePreference(currentLanguage);
    emit(state.copyWith(selectedLanguage: currentLanguage));
  }

  Future<void> _onGetLanguage(
      GetLanguage event, Emitter<LanguageState> emit) async {
    final prefs = locator.get<LocalStorageService>();
    String? language =
        await prefs.readDataFromStorage(key: LocalStorageKey.language);

    Language savedLanguage =
        (language == 'english') ? Language.english : Language.thai;

    emit(state.copyWith(
        selectedLanguage: language != null
            ? Language.values.where((item) => item == savedLanguage).first
            : Language.english));
  }

  Future<Language?> getLanguagePreference() async {
    final prefs = locator.get<LocalStorageService>();
    String? language =
        await prefs.readDataFromStorage(key: LocalStorageKey.language);

    log.debug(
        '[language_bloc.dart][getLanguagePreference]: Language: $language');

    return (language == 'english') ? Language.english : Language.thai;
  }

  Future<void> saveLanguagePreference(Language language) async {
    final prefs = locator.get<LocalStorageService>();

    await prefs.saveDataToStorage(
        key: LocalStorageKey.language,
        value: language == Language.english ? 'english' : 'thai');
  }
}
