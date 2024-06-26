import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:renting_bd/core/di/injection_container.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/core/utils/enums.dart';
import 'package:renting_bd/core/utils/extensions.dart';
import 'package:renting_bd/core/utils/shared_prefs_helper.dart';
import 'package:renting_bd/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:renting_bd/features/presentation/pages/property_listing/landlord_property_list_page.dart';
import 'package:renting_bd/features/presentation/pages/property_listing/tenant_available_property_list_page.dart';
import 'package:renting_bd/features/presentation/widgets/no_role_found.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userRole = getIt<SharedPrefsHelper>().getUserRole();
    final user = context.read<AuthBloc>().state.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(userRole.toGreetings()),
      ),
      drawer: userRole != null && user != null
          ? Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountEmail: Text(user.email ?? "N/A"),
                    accountName: const SizedBox(),
                  ),
                  ListTile(
                    title: const Text("My Profile"),
                    onTap: () {
                      context.pushNamed(RoutePath.profile, extra: user.uid);
                    },
                  ),
                  ListTile(
                    title: const Text("Logout"),
                    onTap: () {
                      context.read<AuthBloc>().add(const LogoutRequested());
                    },
                  ),
                ],
              ),
            )
          : const SizedBox(),
      body: const _HomeBody(),
      floatingActionButton: userRole == UserRole.landlord
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.pushNamed(RoutePath.addProperty);
              })
          : null,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userRole = getIt<SharedPrefsHelper>().getUserRole();

    switch (userRole) {
      case UserRole.landlord:
        return const LandlordPropertyListPage();

      case UserRole.tenant:
        return const TenantAvailablePropertyListPage();

      default:
        return const NoRoleFound();
    }
  }
}
