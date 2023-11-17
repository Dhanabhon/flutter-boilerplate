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
  }

  final log = locator.get<AppLogger>();

  Future<void> _onChangedLanguage(
      ChangedLanguage event, Emitter<LanguageState> emit) async {
    final currentLanguage = event.selectedLanguage;
    final previousLanguage = await getLanguagePreference();

    // log.debug(
    //     '[language_bloc.dart][_onChangedLanguage]: Previous language: ${previousLanguage.toString()}');

    // if (currentLanguage == previousLanguage) {
    //   log.debug(
    //       '[language_bloc.dart][_onChangedLanguage]: Previous language: ${currentLanguage.name}');
    //   return;
    // }

    // log.debug(
    //     '[language_bloc.dart][_onChangedLanguage]: Saved language: ${currentLanguage.name}');

    await saveLanguagePreference(currentLanguage);
    emit(state.copyWith(selectedLanguage: currentLanguage));
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

    // log.debug(
    //     '[language_bloc.dart][saveLanguagePreference]: Language: ${language.name}');
  }
}
