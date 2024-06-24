import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:renting_bd/core/di/injection_container.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/core/utils/input_validator.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';
import 'package:renting_bd/features/presentation/cubits/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LoginCubit>(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(UiHelper.defaultMargin),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Log In to Continue',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                      ),
                      validator: InputValidator.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: InputValidator.validatePassword,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {}
                      },
                      child: const Text('Log In'),
                    ),
                    const SizedBox(height: 20),
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(RoutePath.register);
                      },
                      child: const Text('Sign Up with Email'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
