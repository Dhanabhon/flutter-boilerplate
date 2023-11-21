import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';
import 'package:flutter_boilerplate/routes/router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final log = locator.get<AppLogger>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton<Locale>(
            items: AppLocalizations.supportedLocales
                .map<DropdownMenuItem<Locale>>((Locale value) {
              return DropdownMenuItem<Locale>(
                value: value,
                child: Text(value.languageCode),
              );
            }).toList(),
            onChanged: (locale) {},
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              log.debug("The go back to home button has been pressed!");

              context.go(Routes.home);
            },
            child: Text(l10n!.goBackHome),
          ),
        ],
      )),
    );
  }
}

class SettingsPace extends StatelessWidget {
  const SettingsPace({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
