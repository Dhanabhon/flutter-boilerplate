import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(''),
          )
        ],
      )),
    );
  }
}
