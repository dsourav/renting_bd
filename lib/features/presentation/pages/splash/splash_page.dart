import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting_bd/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:renting_bd/features/presentation/pages/auth/login_page.dart';
import 'package:renting_bd/features/presentation/pages/home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
        } else if (state.status == AuthStatus.unauthenticated) {}
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
