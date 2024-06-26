import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:renting_bd/core/di/injection_container.dart';
import 'package:renting_bd/core/router/route_path.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';
import 'package:renting_bd/features/data/models/user_model.dart';
import 'package:renting_bd/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:renting_bd/features/presentation/cubits/profile/profile_cubit.dart';
import 'package:renting_bd/features/presentation/pages/profile/widgets/profile_info.dart';
import 'package:renting_bd/features/presentation/widgets/app_network_image.dart';
import 'package:renting_bd/features/presentation/widgets/not_found_image.dart';
import 'package:renting_bd/features/presentation/widgets/shimmer/list_item_placeholder.dart';

class ProfilePage extends StatelessWidget {
  final String userId;
  const ProfilePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: _ProfileBody(userId: userId),
    );
  }
}

class _ProfileBody extends StatefulWidget {
  final String userId;
  const _ProfileBody({required this.userId});

  @override
  State<_ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<_ProfileBody> {
  @override
  void initState() {
    context.read<ProfileCubit>().loadUserProfile(userId: widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthBloc>().state.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          BlocSelector<ProfileCubit, ProfileState, UserModel?>(
              selector: (state) => state.userModel,
              builder: (_, user) {
                if (user != null && user.uuid == currentUser?.uid) {
                  return IconButton(
                      onPressed: () {
                        final profile = context.read<ProfileCubit>();
                        context.pushNamed(RoutePath.updateProfile, extra: profile);
                      },
                      icon: const Icon(Icons.edit));
                }
                return const SizedBox();
              })
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: ((context, state) {
          if (state.status == ProfileStatus.loaded) {
            return _ProfileView(userModel: state.userModel);
          } else if (state.status == ProfileStatus.initial) {
            return const ListItemPlaceHolder();
          } else {
            return const Center(child: NotFoundImage());
          }
        }),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  final UserModel? userModel;
  const _ProfileView({
    this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UiHelper.defaultMargin),
      child: ListView(
        children: [
          AppNetworkImage(size: const Size(120, 120), imageUrl: userModel?.profilePicture),
          const SizedBox(height: 10.0),
          ProfileInfo(title: "Name", content: userModel?.name),
          ProfileInfo(title: "Email", content: userModel?.email),
          ProfileInfo(title: "Phone Number", content: userModel?.phoneNumber),
        ],
      ),
    );
  }
}
