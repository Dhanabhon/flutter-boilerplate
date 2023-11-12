import 'package:equatable/equatable.dart';

enum Language { english, thai }

class LanguageState extends Equatable {
  final Language language;
  const LanguageState(this.language);

  @override
  List<Object?> get props => [language];

  Future<LanguageState> copyWith(Language language) async {
    return LanguageState(language);
  }
}
