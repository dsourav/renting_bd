import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/features/presentation/cubits/profile/profile_cubit.dart';
import 'package:renting_bd/features/presentation/pages/auth/login_page.dart';
import 'package:renting_bd/features/presentation/pages/auth/register_page.dart';
import 'package:renting_bd/features/presentation/pages/home/home_page.dart';
import 'package:renting_bd/features/presentation/pages/profile/profile_page.dart';
import 'package:renting_bd/features/presentation/pages/profile/update_profile_page.dart';
import 'package:renting_bd/features/presentation/pages/splash/splash_page.dart';

@singleton
class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RoutePath.register,
        name: RoutePath.register,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: RoutePath.login,
        name: RoutePath.login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: RoutePath.home,
        name: RoutePath.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RoutePath.profile,
        name: RoutePath.profile,
        builder: (context, state) => ProfilePage(
          userId: state.extra as String,
        ),
      ),
      GoRoute(
        path: RoutePath.updateProfile,
        name: RoutePath.updateProfile,
        builder: (context, state) => BlocProvider.value(
          value: state.extra as ProfileCubit,
          child: const UpdateProfilePage(),
        ),
      ),
    ],
  );
}
