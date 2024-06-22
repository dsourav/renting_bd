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

  const UserModel({required this.uuid, required this.role, this.email, this.phoneNumber, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [uuid, role, email, phoneNumber, name];
}
