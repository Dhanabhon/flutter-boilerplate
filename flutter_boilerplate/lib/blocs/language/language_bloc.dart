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

    log.debug(
        '[language_bloc.dart][_onChangedLanguage]: Saved language: ${currentLanguage.name}');

    await saveLanguagePreference(currentLanguage);
    emit(state.copyWith(selectedLanguage: currentLanguage));
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
