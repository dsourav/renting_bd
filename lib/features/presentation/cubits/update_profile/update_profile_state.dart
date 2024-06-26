part of 'update_profile_cubit.dart';

class UpdateProfileState extends Equatable {
  const UpdateProfileState._({this.pickedFile, this.userModel});

  const UpdateProfileState.initial() : this._();
  const UpdateProfileState.pickedLocalImage(XFile file) : this._(pickedFile: file);
  const UpdateProfileState.profileUpdated(UserModel userModel) : this._(userModel: userModel);

  final XFile? pickedFile;
  final UserModel? userModel;

  @override
  List<Object?> get props => [pickedFile, userModel];
}
