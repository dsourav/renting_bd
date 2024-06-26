import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String uuid;
  final String role;
  final String? email;
  final String? phoneNumber;
  final String? name;
  final String? profilePicture;

  const UserModel(
      {required this.uuid, required this.role, this.email, this.phoneNumber, this.name, this.profilePicture});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [uuid, role, email, phoneNumber, name];

  UserModel copyWith({
    String? uuid,
    String? role,
    String? email,
    String? phoneNumber,
    String? name,
    String? profilePicture,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      role: role ?? this.role,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
