import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:renting_bd/core/router/app_router.dart';
import 'package:renting_bd/core/theme/app_theme.dart';
import 'package:renting_bd/core/theme/app_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:renting_bd/features/presentation/blocs/auth/auth_bloc.dart';
import 'core/di/injection_container.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>(), lazy: false),
      ],
      child: AppTheme(
        lightTheme: _lightTheme,
        darkTheme: _darkTheme,
        child: MaterialApp.router(
          title: 'Renting BD',
          debugShowCheckedModeBanner: false,
          theme: _lightTheme.materialThemeData,
          darkTheme: _darkTheme.materialThemeData,
          routerConfig: getIt<AppRouter>().router,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
