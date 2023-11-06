import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_boilerplate/bloc/language/language_bloc.dart';
import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/screens/home/home.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (create) => LanguageBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Boilerplate Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );
  }
}
