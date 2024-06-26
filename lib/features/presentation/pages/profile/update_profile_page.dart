import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting_bd/core/di/injection_container.dart';
import 'package:renting_bd/core/utils/input_validator.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';
import 'package:renting_bd/features/presentation/cubits/profile/profile_cubit.dart';
import 'package:renting_bd/features/presentation/cubits/update_profile/update_profile_cubit.dart';
import 'package:renting_bd/features/presentation/widgets/app_local_image.dart';
import 'package:renting_bd/features/presentation/widgets/app_network_image.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final userProfile = context.read<ProfileCubit>().state.userModel;
    _name.text = userProfile?.name ?? "";
    _phone.text = userProfile?.phoneNumber ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UpdateProfileCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Edit Profile"),
          ),
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
                padding: EdgeInsets.all(UiHelper.defaultMargin),
                child: ListView(
                  children: [
                    const _ProfileImage(),
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                      ),
                      validator: InputValidator.validateUserName,
                    ),
                    TextFormField(
                      controller: _phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                      validator: InputValidator.validatePhoneNumber,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        final userProfile = context.read<ProfileCubit>().state.userModel;
                        if (_formKey.currentState?.validate() == true && userProfile != null) {
                          final updatedProfile = userProfile.copyWith(name: _name.text, phoneNumber: _phone.text);
                          context.read<UpdateProfileCubit>().updateProfile(updatedProfile);
                        }
                      },
                      child: const Text('Update'),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<ProfileCubit>().state.userModel;
    final pickedImage = context.select((UpdateProfileCubit updateProfile) => updateProfile.state.pickedFile);

    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (pickedImage?.path != null) ...[
            AppLocalImage(imageUrl: pickedImage!.path, imageShape: ImageShape.circular, radius: 60),
          ] else ...[
            AppNetworkImage(imageUrl: userProfile!.profilePicture, size: const Size(120, 120)),
          ],
          IconButton(
              onPressed: () {
                context.read<UpdateProfileCubit>().pickImageFromGallery();
              },
              icon: const Icon(Icons.edit))
        ],
      ),
    );
  }
}
