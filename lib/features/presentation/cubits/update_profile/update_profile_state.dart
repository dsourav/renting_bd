part of 'update_profile_cubit.dart';

class UpdateProfileState extends Equatable {
  const UpdateProfileState._({this.pickedFile});

  const UpdateProfileState.initial() : this._();
  const UpdateProfileState.pickedLocalImage(XFile file) : this._(pickedFile: file);

  final XFile? pickedFile;

  @override
  List<Object?> get props => [pickedFile];
}
