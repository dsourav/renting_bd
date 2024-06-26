import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting_bd/core/di/injection_container.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/core/utils/input_validator.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';
import 'package:renting_bd/features/presentation/blocs/auth/auth_bloc.dart';
import 'package:renting_bd/features/presentation/cubits/add_new_properties/add_new_properties_cubit.dart';
import 'package:renting_bd/features/presentation/widgets/app_local_image.dart';
import 'package:renting_bd/features/presentation/widgets/app_network_image.dart';

class AddNewPropertyPage extends StatelessWidget {
  AddNewPropertyPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddNewPropertiesCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('List Rental Property'),
          ),
          body: Padding(
            padding: EdgeInsets.all(UiHelper.defaultMargin),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const _PropertyImage(),
                  TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                      validator: (value) => InputValidator.emptyValidation(value, "Title")),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) => InputValidator.emptyValidation(value, "Description"),
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) => InputValidator.emptyValidation(value, "Price"),
                  ),
                  const SizedBox(height: 10),
                  const _LocationDropdown(),
                  const SizedBox(height: 10),
                  const PropertyDropdown(),
                  const SizedBox(height: 10),
                  const _AvailabilitySwitch(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final user = context.read<AuthBloc>().state.user;
                      if (_formKey.currentState?.validate() == true && user?.uid != null) {
                        context.read<AddNewPropertiesCubit>().addProperty(
                            description: _descriptionController.text,
                            propertyPrice: _priceController.text,
                            title: _titleController.text,
                            userId: user!.uid);
                        // Process data
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _PropertyImage extends StatelessWidget {
  const _PropertyImage();

  @override
  Widget build(BuildContext context) {
    final xFile = context.select((AddNewPropertiesCubit addNewProperty) => addNewProperty.state.xFile);

    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            child: xFile?.path != null
                ? AppLocalImage(size: const Size(120, 120), imageUrl: xFile!.path, imageShape: ImageShape.square)
                : const ErrorImage(
                    imageShape: ImageShape.square,
                    size: Size(120, 120),
                  ),
          ),
        ),
        IconButton(
            onPressed: () {
              context.read<AddNewPropertiesCubit>().pickImageFromGallery();
            },
            icon: const Icon(Icons.edit))
      ],
    );
  }
}

class _AvailabilitySwitch extends StatelessWidget {
  const _AvailabilitySwitch();

  @override
  Widget build(BuildContext context) {
    final isAvailable = context.select((AddNewPropertiesCubit addNewProperty) => addNewProperty.state.isAvailable);
    return SwitchListTile(
      title: const Text('Availability'),
      value: isAvailable,
      onChanged: (value) {
        context.read<AddNewPropertiesCubit>().updateAvailability(value);
      },
    );
  }
}

class PropertyDropdown extends StatelessWidget {
  const PropertyDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyType = context.select((AddNewPropertiesCubit addNewProperty) => addNewProperty.state.propertyType);

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: 'Property Type'),
      value: propertyType,
      items: PropertyType.getAll.map((String type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (String? newValue) {
        context.read<AddNewPropertiesCubit>().updatePropertyType(newValue);
      },
      validator: (value) => InputValidator.emptyValidation(value, 'Property Type'),
    );
  }
}

class _LocationDropdown extends StatelessWidget {
  const _LocationDropdown();

  @override
  Widget build(BuildContext context) {
    final location = context.select((AddNewPropertiesCubit addNewProperty) => addNewProperty.state.location);

    return DropdownButtonFormField<String>(
        decoration: const InputDecoration(labelText: 'Location'),
        value: location,
        items: LocationType.getAll.map((String location) {
          return DropdownMenuItem<String>(
            value: location,
            child: Text(location),
          );
        }).toList(),
        onChanged: (String? newValue) {
          context.read<AddNewPropertiesCubit>().updateLocationType(newValue);
        },
        validator: (value) => InputValidator.emptyValidation(value, "Location"));
  }
}
