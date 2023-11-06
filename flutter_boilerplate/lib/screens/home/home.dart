import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';
import 'package:flutter_boilerplate/routes/routes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final log = locator.get<AppLogger>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.hello,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                log.debug("The change language button has been pressed!");

                context.go(AppRouter.settings);
              },
              child: Text(
                AppLocalizations.of(context)!.settings,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
