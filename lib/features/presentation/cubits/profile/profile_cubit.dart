import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/features/data/models/user_model.dart';
import 'package:renting_bd/features/domain/usecases/profile_usecase/fetch_user_profile_usecase.dart';
import 'package:renting_bd/features/domain/usecases/profile_usecase/update_user_profile_usecase.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final UpdateUserProfileUseCase updateUserProfileUseCase;
  final FetchUserProfileUseCase fetchUserProfileUseCase;
  ProfileCubit(this.updateUserProfileUseCase, this.fetchUserProfileUseCase) : super(const ProfileState.loading());

  loadUserProfile({String? userId}) async {
    final userProfileResponse = await fetchUserProfileUseCase.call(FetUserProfileParams(userId: userId));

    userProfileResponse.fold((failure) => emit(const ProfileState.loadFailed()), (user) {
      if (user != null) {
        emit(ProfileState.profileLoaded(user));
      } else {
        emit(const ProfileState.loadFailed());
      }
    });
  }
}
