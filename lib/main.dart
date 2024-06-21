import 'package:flutter/material.dart';
import 'package:renting_bd/core/router/app_router.dart';
import 'package:renting_bd/core/theme/app_theme.dart';
import 'package:renting_bd/core/theme/app_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/di/injection_container.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        routerConfig: AppRouter.router,
      ),
    );
  }
}
