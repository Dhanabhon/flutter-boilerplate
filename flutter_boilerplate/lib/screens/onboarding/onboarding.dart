import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/bloc/language/language_bloc.dart';
import 'package:flutter_boilerplate/bloc/language/language_state.dart';

import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: OutlinedButton(
              onPressed: () {},
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
                        return state.language.
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
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(l10n.getStartedText),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
