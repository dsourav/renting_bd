part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState._({
    this.status = ProfileStatus.initial,
    this.userModel,
  });

  final ProfileStatus status;
  final UserModel? userModel;

  const ProfileState.loading() : this._(status: ProfileStatus.initial);
  const ProfileState.loadFailed() : this._(status: ProfileStatus.loadFailed);
  const ProfileState.profileLoaded(UserModel userModel) : this._(status: ProfileStatus.loaded, userModel: userModel);

  @override
  List<Object?> get props => [status, userModel];
}

enum ProfileStatus { initial, loaded, loadFailed }
