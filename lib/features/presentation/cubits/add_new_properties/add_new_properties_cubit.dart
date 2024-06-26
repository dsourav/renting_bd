import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/services/cloud_storage_service.dart';
import 'package:renting_bd/core/services/image_picker_service.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/core/utils/progress_indicator.dart';
import 'package:renting_bd/features/domain/usecases/property_listing_usecases/add_property_usecase.dart';

part 'add_new_properties_state.dart';

@injectable
class AddNewPropertiesCubit extends Cubit<AddNewPropertiesState> {
  final ImagePickerService imagePickerService;
  final ProgressIndicator progressIndicator;
  final CloudStorageService cloudStorageService;
  final AddPropertyUseCase addPropertyUseCase;

  AddNewPropertiesCubit(
      this.cloudStorageService, this.imagePickerService, this.progressIndicator, this.addPropertyUseCase)
      : super(const AddNewPropertiesState());

  pickImageFromGallery() async {
    final fileResponse = await imagePickerService.pickImage();
    fileResponse.fold((failure) => progressIndicator.showError(error: failure.message), (xFile) {
      if (xFile != null) emit(state.copyWith(xFile: xFile));
    });
  }

  addProperty(
      {required String title,
      required String description,
      required String propertyPrice,
      required String userId}) async {
    String? imageUrl;
    final price = double.tryParse(propertyPrice.toString()) ?? 0;
    await progressIndicator.show();
    if (state.xFile != null) {
      imageUrl = await cloudStorageService.uploadFile(
          fileToUpload: File(state.xFile!.path), path: Constant.propertyImageDirPath(userId));
    }

    final updatedParams = AddPropertyParams(
        ownerId: userId,
        title: title,
        description: description,
        pictureUrls: imageUrl != null ? [imageUrl] : [],
        price: price,
        availability: state.isAvailable,
        location: state.location,
        propertyType: state.propertyType);

    final propertyResponse = await addPropertyUseCase.call(updatedParams);
    propertyResponse.fold((failure) => progressIndicator.showError(error: failure.message), (_) {
      progressIndicator.showSuccess();
    });
  }

  updateAvailability(bool availability) {
    emit(state.copyWith(isAvailable: availability));
  }

  updatePropertyType(String? propertyType) {
    if (propertyType != null) emit(state.copyWith(propertyType: propertyType));
  }

  updateLocationType(String? location) {
    if (location != null) emit(state.copyWith(location: location));
  }
}
