import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    required super.child,
    required this.lightTheme,
    required this.darkTheme,
    super.key,
  });

  final AppThemeData lightTheme;
  final AppThemeData darkTheme;

  @override
  bool updateShouldNotify(
    AppTheme oldWidget,
  ) =>
      oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;

  static AppThemeData of(BuildContext context) {
    final AppTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inheritedTheme != null, 'No Theme found in context');
    final currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark ? inheritedTheme!.darkTheme : inheritedTheme!.lightTheme;
  }
}
