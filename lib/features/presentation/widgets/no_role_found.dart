import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:renting_bd/features/presentation/widgets/not_found_image.dart';

class NoRoleFound extends StatelessWidget {
  const NoRoleFound({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Constant.noRoleFoundLabel, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 20.0),
          const NotFoundImage(),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(const LogoutRequested());
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
