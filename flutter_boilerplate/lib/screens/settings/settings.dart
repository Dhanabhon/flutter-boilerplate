import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/routes/router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Center(
          child: Column(
        children: [
          Text(AppLocalizations.of(context)!.darkTheme),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              $log.debug("The go back to home button has been pressed!");

              context.go(Routes.home);
            },
            child: Text(l10n!.goBackHome),
          ),
        ],
      )),
    );
  }
}
