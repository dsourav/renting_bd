import 'package:flutter/material.dart';

import 'app_color.dart';

class AppLightThemeData implements AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
      brightness: Brightness.light,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryGreen),
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryGreen));
}

class AppDarkThemeData implements AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
      brightness: Brightness.dark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryGreen),
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryGreen));
}

abstract class AppThemeData {
  ThemeData get materialThemeData;
}
