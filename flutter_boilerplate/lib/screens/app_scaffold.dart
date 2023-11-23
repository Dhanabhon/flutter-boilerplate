import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/config/styles.dart';
import 'package:flutter_boilerplate/config/theme.dart';
import 'package:flutter_boilerplate/widgets/app_scroll_behavior.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;
  static final AppStyle _style = AppStyle();
  static AppStyle get style => _style;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey(style.scale),
      child: Theme(
        data: CustomTheme.lightTheme, // TODO:Fix somethiing!!
        child: DefaultTextStyle(
          style: style.text.body,
          child: ScrollConfiguration(
            behavior: AppScrollBehavior(),
            child: child,
          ),
        ),
      ),
    );
  }
}
