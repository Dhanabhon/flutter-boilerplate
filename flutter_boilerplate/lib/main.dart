import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_boilerplate/config/theme.dart';
import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/routes/routes.dart';
import 'package:flutter_boilerplate/blocs/bloc_observer.dart';
import 'package:flutter_boilerplate/blocs/language/language_bloc.dart';
import 'package:flutter_boilerplate/blocs/language/language_state.dart';
import 'package:flutter_boilerplate/blocs/theme/theme_bloc.dart';
import 'package:flutter_boilerplate/blocs/theme/theme_event.dart';

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
        BlocProvider<LanguageBloc>(
            create: (context) => locator<LanguageBloc>()),
        BlocProvider<ThemeBloc>(
            create: (context) => locator()..add(InitializedTheme())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (themeContext, themeState) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (languageContext, languageState) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Boilerplate Demo',
                locale: languageState.selectedLanguage.name == 'english'
                    ? const Locale('en')
                    : const Locale('th'),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: AppRouter.router,
                theme: themeState,
                darkTheme: CustomTheme.darkTheme,
                themeMode: ThemeMode.system,
              );
            },
          );
        },
      ),
    );
  }
}
