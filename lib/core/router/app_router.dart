import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/features/presentation/pages/auth/login_page.dart';
import 'package:renting_bd/features/presentation/pages/auth/register_page.dart';
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
    ],
  );
}
