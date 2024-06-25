import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting_bd/core/utils/input_validator.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';
import 'package:renting_bd/features/presentation/cubits/profile/profile_cubit.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _name = TextEditingController();
  final _phone = TextEditingController();

  @override
  void initState() {
    final userProfile = context.read<ProfileCubit>().state.userModel;
    _name.text = userProfile?.name ?? "";
    _phone.text = userProfile?.phoneNumber ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: Container(
          padding: EdgeInsets.all(UiHelper.defaultMargin),
          child: ListView(
            children: [
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
            ],
          )),
    );
  }
}
