import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/services/cloud_storage_service.dart';
import 'package:renting_bd/core/services/image_picker_service.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/core/utils/progress_indicator.dart';
import 'package:renting_bd/features/data/models/user_model.dart';
import 'package:renting_bd/features/domain/usecases/profile_usecase/update_user_profile_usecase.dart';

part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ImagePickerService imagePickerService;
  final UpdateUserProfileUseCase updateUserProfileUseCase;
  final ProgressIndicator progressIndicator;
  final CloudStorageService cloudStorageService;
  UpdateProfileCubit(
      this.imagePickerService, this.updateUserProfileUseCase, this.cloudStorageService, this.progressIndicator)
      : super(const UpdateProfileState.initial());

  pickImageFromGallery() async {
    final fileResponse = await imagePickerService.pickImage();
    fileResponse.fold((failure) => progressIndicator.showError(error: failure.message), (xFile) {
      if (xFile != null) emit(UpdateProfileState.pickedLocalImage(xFile));
    });
  }

  updateProfile(UserModel userModel) async {
    String? imageUrl;
    await progressIndicator.show();
    if (state.pickedFile != null) {
      imageUrl = await cloudStorageService.uploadFile(
          fileToUpload: File(state.pickedFile!.path), path: Constant.profileImageDirPath(userModel.uuid));
    }

    final updatedProfile = userModel.copyWith(profilePicture: imageUrl);
    final profileResponse = await updateUserProfileUseCase.call(updatedProfile);
    profileResponse.fold(
        (failure) => progressIndicator.showError(error: failure.message), (_) => progressIndicator.showSuccess());
  }
}
