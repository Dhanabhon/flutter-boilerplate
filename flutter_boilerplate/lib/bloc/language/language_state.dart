import 'package:equatable/equatable.dart';

enum Language { english, thai }

class LanguageState extends Equatable {
  final Language selectedLanguage;
  const LanguageState(this.selectedLanguage);

  @override
  List<Object?> get props => [selectedLanguage];

  Future<LanguageState> copyWith(Language language) async {
    return LanguageState(language);
  }
}
