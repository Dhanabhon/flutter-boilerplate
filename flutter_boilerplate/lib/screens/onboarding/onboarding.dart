import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_boilerplate/gen/assets.gen.dart';

import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/widgets/custom_elevated_button.dart';
import 'package:flutter_boilerplate/blocs/language/language_bloc.dart';
import 'package:flutter_boilerplate/blocs/language/language_event.dart';
import 'package:flutter_boilerplate/blocs/language/language_state.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    final l10n = AppLocalizations.of(context)!;

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
                $log.debug(
                    '[onboarding.dart]: Change language button has been pressed!');

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
                        return state.selectedLanguage == Language.english
                            ? Assets.images.flags.unitedStates.image()
                            : Assets.images.flags.thailand.image();
                      },
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Container(
                child: Assets.images.mockup.image457x344.image(
                  width: 400,
                  height: 400,
                  fit: BoxFit.scaleDown,
                ),
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
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomElevatedButton(
                onPressed: () {
                  $log.debug(
                      '[onboarding.dart]: Get Started Button has been pressed!');

                  // TODO: Save the get started status into local storage

                  // context.go(Routes.rootPath);
                },
                text: l10n.getStartedText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                l10n.preferredLanguage,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                ),
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: Language.values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(Language.values[index].name == "english"
                            ? "English"
                            : "ภาษาไทย"),
                        tileColor:
                            Language.values[index] == state.selectedLanguage
                                ? Colors.grey[400]?.withOpacity(0.05)
                                : null,
                        onTap: () {
                          $log.debug(
                              '[onboarding.dart][showModalBottomSheet]: Selected item: ${Language.values[index].name}');

                          context.read<LanguageBloc>().add(ChangedLanguage(
                              selectedLanguage: Language.values[index]));

                          Future.delayed(const Duration(milliseconds: 300))
                              .then((value) => context.pop());
                        },
                        leading: ClipOval(
                          child: Language.values[index].name == "english"
                              ? Assets.images.flags.unitedStates
                                  .image(height: 32.0, width: 32.0)
                              : Assets.images.flags.thailand
                                  .image(height: 32.0, width: 32.0),
                        ),
                        trailing:
                            Language.values[index] == state.selectedLanguage
                                ? const Icon(Icons.check_circle_outline_rounded)
                                : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: Language.values[index] == state.selectedLanguage
                              ? const BorderSide(
                                  color: Color(0xFF486284), width: 1.5)
                              : const BorderSide(color: Color(0xFFD9D9D9)),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16.0);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
