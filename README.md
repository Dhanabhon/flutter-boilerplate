# Flutter Boilerplate

A simple boilerplate project that adopts the concepts of simple architecture and modularization.

## Key Features

* [x] State Management (BLoC)
* [x] Localization (English and Thai)
* [x] Routing
* [x] Logging
* [ ] Theme Modes (Light and Dark)
* [ ] Splash Screen
* [ ] Permission Handling

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
    - main.dart: The entry point of the Flutter app.
    - secreen: Each screen of the app has its own folder with its corresponding widgets.
    - models: Define the data models here.
    - services: Place API calls and other data-related services here.
    - utils: Utility functions, constants, and helpers.
    - widgets: Reusable widgets that are used across different screens.
2. assets: Store the static assets like images, fonts, and ARB files here.
3. test: Contains unit and widget tests for your app.
4. android and ios: Native code for Android and iOS, respectively. Flutter uses these folders to build your app for each platform.
5. web: If you're targeting the web, you'll find web-specific configurations here.
6. pubspec.yaml: Dependency management and project configuration file.
7. README.md: Documentation for the project. 

### Installation

**Step 1: Clone this repo**
```
    git clone https://github.com/Dhanabhon/flutter-boilerplate.git
```
**Step 2: Navigate to the Flutter project:**
```
    cd flutter-boilerplate
```
**Step 3: Execute the following command to get the required dependencies:**
```
    flutter pub get
```
**Step 4 (Optional): If you want to change the app name, try to use the following dependency:**

- [rename](https://pub.dev/packages/rename)
- [change_app_package_name](https://pub.dev/packages/change_app_package_name)

## Adding translation file

Flutter localization uses ARB (Application Resource Bundle) files for translations.

- Create the template ARB file, assets/locales/LANGUAGE_CODE.arb
- The tool that generates the localizations class will execute automatically each time the application is run or restarted as part of the build process or force execute for generate use this command:

```
    dart run build_runner build
```

Note: Filenames for all arb files cannot contain underscores other than for describing the locale. The internationalization tool uses underscores to parse out the language, country, and script codes for each ARB file.

## Credits

- [Bank of america icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/bank-of-america)
- [Thailand icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/thailand)

### Note: This repository is under development.
