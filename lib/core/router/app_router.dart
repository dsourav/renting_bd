import 'package:go_router/go_router.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/features/presentation/pages/auth/login_page.dart';
import 'package:renting_bd/features/presentation/pages/auth/register_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: RoutePath.signUp,
        name: RoutePath.signUp,
        builder: (context, state) => RegisterPage(),
      ),
    ],
  );
}
