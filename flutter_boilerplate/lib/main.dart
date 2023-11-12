import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_boilerplate/config/theme.dart';
import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/routes/routes.dart';
import 'package:flutter_boilerplate/bloc/bloc_observer.dart';
import 'package:flutter_boilerplate/bloc/language/language_bloc.dart';
import 'package:flutter_boilerplate/bloc/theme/theme_bloc.dart';
import 'package:flutter_boilerplate/bloc/theme/theme_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeApp();
  runApp(const MyApp());
}

void initializeApp() {
  setupLocator();
  Bloc.observer = AppBlocServer();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (create) => LanguageBloc()),
        BlocProvider<ThemeBloc>(
            create: (context) => locator()..add(InitializedTheme())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Boilerplate Demo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: AppRouter.router,
            theme: state,
            darkTheme: CustomTheme.darkTheme,
            themeMode: ThemeMode.system,
          );
        },
      ),
    );
  }
}
