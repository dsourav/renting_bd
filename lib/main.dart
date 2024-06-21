import 'package:flutter/material.dart';
import 'package:renting_bd/core/theme/app_theme.dart';
import 'package:renting_bd/core/theme/app_theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RentingBD());
}

class RentingBD extends StatelessWidget {
  RentingBD({super.key});

  final _lightTheme = AppLightThemeData();
  final _darkTheme = AppDarkThemeData();

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp.router(
        title: 'Renting BD',
        debugShowCheckedModeBanner: false,
        theme: _lightTheme.materialThemeData,
        darkTheme: _darkTheme.materialThemeData,
      ),
    );
  }
}
