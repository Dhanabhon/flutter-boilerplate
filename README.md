# Flutter Boilerplate (This repository is under development)

A simple boilerplate project that adopts the concepts of BLoC architecture, modularization, and lightweight.

## Key Features

* ✅ Material Design 3 (As of the Flutter 3.16 release, Material 3 is enabled by default.)
* ✅ Simple layered architecture
* ✅ State Management with BLoC
* ✅ Dependency injection with watch_it (aka get_it)
* ✅ Localization (English and Thai)
* ✅ Routing
* ✅ Logging
* ✅ Encrypted Storage
* ✅ Splash Screen
* 🚧 Theme Modes (Light and Dark)
* 🚧 Onboarding Screen (Get Started)
* 🚧 Responsive UI (Focus on Mobile)
* 🚧 Permission Handling

### Folder Structure

```
project_name/
  ├── lib/
  │   ├── blocs/
  │   │   ├── language/
  │   │   │   ├── language_bloc.dart
  │   │   │   ├── language_event.dart
  │   │   │   ├── language_state.dart
  │   │   ├── theme/
  │   │   │   ├── theme_bloc.dart
  │   │   │   ├── theme_event.dart
  │   │   ├── bloc_observer.dart     
  │   ├── screens/
  │   │   ├── home/
  │   │   │   ├── home_screen.dart
  │   │   │   └── widgets/
  │   │   │       ├── home_widget1.dart
  │   │   │       ├── home_widget2.dart
  │   │   │       └── ...
  │   │   ├── profile/
  │   │   │   ├── profile_screen.dart
  │   │   │   └── widgets/
  │   │   │       ├── profile_widget1.dart
  │   │   │       ├── profile_widget2.dart
  │   │   │       └── ...
  │   │   └── ...
  │   ├── models/
  │   │   ├── user.dart
  │   │   ├── product.dart
  │   │   └── ...
  │   ├── services/
  │   │   ├── api_service.dart
  │   │   ├── database_service.dart
  │   │   └── ...
  │   ├── utils/
  │   │   ├── constants.dart
  │   │   ├── helpers.dart
  │   │   └── ...
  │   ├── widgets/
  │   │   ├── custom_button.dart
  │   │   ├── custom_textfield.dart
  │   │   └── ...
  │   └── main.dart
  ├── assets/
  │   ├── images/
  │   │   ├── image1.png
  │   │   ├── image2.png
  │   │   └── ...
  │   ├── fonts/
  │   │   ├── font1.ttf
  │   │   ├── font2.ttf
  │   │   └── ...
  │   └── ...
  ├── test/
  │   ├── unit/
  │   ├── widget/
  │   └── ...
  ├── android/
  ├── ios/
  ├── web/
  ├── pubspec.yaml
  └── README.md
```

Explanation of the folder structure:

1. lib: This is where your Dart code resides.
    * main.dart: The entry point of the Flutter app.
    * secreen: Each screen of the app has its own folder with its corresponding widgets.
    * models: Define the data models here.
    * services: Place API calls and other data-related services here.
    * utils: Utility functions, constants, and helpers.
    * widgets: Reusable widgets that are used across different screens.
2. assets: Store the static assets like images, fonts, and ARB files here.
3. test: Contains unit and widget tests for your app.
4. android and ios: Native code for Android and iOS, respectively. Flutter uses these folders to build your app for each platform.
5. web: If you're targeting the web, you'll find web-specific configurations here.
6. pubspec.yaml: Dependency management and project configuration file.
7. README.md: Documentation for the project. 

### Installation

Step 1: Clone this repo

* `git clone https://github.com/Dhanabhon/flutter-boilerplate.git`

Step 2: Navigate to the Flutter project:

* `cd flutter-boilerplate`

Step 3: Execute the following command to get the required dependencies:

* `flutter pub get`

Setp 4: Run the app on your local device or simulation:

* `flutter run -d ios`
* `flutter run -d android`
* `flutter run`

Step 5 (Optional): If you want to change the app name, try to use the following dependency:

* [rename](https://pub.dev/packages/rename)
* [change_app_package_name](https://pub.dev/packages/change_app_package_name)

## Adding translation file

Flutter localization uses ARB (Application Resource Bundle) files for translations.

* Create the template ARB file, assets/locales/LANGUAGE_CODE.arb
* The tool that generates the localizations class will execute automatically each time the application is run or restarted as part of the build process or force execute for generate use this command: `dart run build_runner build`

Note: Filenames for all arb files cannot contain underscores other than for describing the locale. The internationalization tool uses underscores to parse out the language, country, and script codes for each ARB file.

## Changing Icon App

* [icons_launcher](https://pub.dev/packages/icons_launcher)

## Changing Splash Screen

* Setting the splash screen where `flutter_native_splash-development.yaml`
* Run the package using the following command
* `dart run flutter_native_splash:create --flavor development`
* More infomation [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

## Version

* Flutter 3.16.0
* Dart 3.2.0
* DevTools 2.28.2

## Credits

* [Bank of america icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/bank-of-america)
* [Thailand icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/thailand)

## License

This application is released under the [MIT license](LICENSE). You can use the code for any purpose, including commercial projects.

[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)