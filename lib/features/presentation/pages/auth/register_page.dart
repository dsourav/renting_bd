import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting_bd/core/di/injection_container.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/core/utils/input_validator.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';
import 'package:renting_bd/features/domain/usecases/auth_usecases/register_usecase.dart';
import 'package:renting_bd/features/presentation/cubits/register/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
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
                        'Register Now',
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
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: InputValidator.validatePassword,
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        hint: const Text('Select Role'),
                        items: Constant.userRoles
                            .map((role) => DropdownMenuItem<String>(
                                  value: role,
                                  child: Text(role),
                                ))
                            .toList(),
                        onChanged: context.read<RegisterCubit>().onChangeRole,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Constant.selectRoleLabel;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final registerCubit = context.read<RegisterCubit>();
                            final role = registerCubit.state.role;

                            registerCubit.registerNewUser(
                                RegisterParams(email: _email.text, password: _password.text, role: role));
                          }
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
