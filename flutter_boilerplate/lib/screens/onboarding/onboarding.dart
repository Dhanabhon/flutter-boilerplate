import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/bloc/language/language_bloc.dart';
import 'package:flutter_boilerplate/bloc/language/language_state.dart';
import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final log = locator.get<AppLogger>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: OutlinedButton(
              onPressed: () {
                log.debug(
                    '[OnboardingPage]: Change language button has been pressed!');

                showLanguageBottomSheet(context);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(8.0),
                foregroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: BlocBuilder<LanguageBloc, LanguageState>(
                      builder: (context, state) {
                        return state.language == Language.english
                            ? Assets.images.flags.unitedStatesOfAmerica.image()
                            : Assets.images.flags.thailand.image();
                      },
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.grey[400],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Assets.images.mockup.image457x344.image(
                width: 256,
                height: 256,
                fit: BoxFit.scaleDown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.onboardingText,
                    style: TextStyle(
                      color: const Color(0xFF486284),
                      fontSize:
                          Theme.of(context).textTheme.displaySmall?.fontSize,
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                log.debug(
                    '[OnboardingPage]: Get Started Button has been pressed!');
              },
              child: Text(l10n.getStartedText),
            )
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final log = locator.get<AppLogger>();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.chooseLanguage,
                style: TextStyle(
                  color: const Color(0xFF486284),
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                ),
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(Language.values[index].name == "english"
                            ? "English"
                            : "ภาษาไทย"),
                        tileColor: Language.values[index] == state.language
                            ? Colors.grey[400]?.withOpacity(0.05)
                            : null,
                        onTap: () {
                          log.debug(
                              '[OnboardingPage][showModalBottomSheet]: Item has been tapped!');
                          // TODO:
                        },
                        leading: ClipOval(
                          child: Language.values[index].name == "english"
                              ? Assets.images.flags.unitedStatesOfAmerica
                                  .image(height: 32.0, width: 32.0)
                              : Assets.images.flags.thailand
                                  .image(height: 32.0, width: 32.0),
                        ),
                        trailing: Language.values[index] == state.language
                            ? const Icon(Icons.check_circle_outline_rounded,
                                color: Color(0xFF486284))
                            : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: Language.values[index] == state.language
                              ? const BorderSide(
                                  color: Color(0xFF486284), width: 1.5)
                              : const BorderSide(color: Color(0xFFD9D9D9)),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16.0);
                    },
                    itemCount: Language.values.length,
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
