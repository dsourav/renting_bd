part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState._({
    this.role = Constant.landlord,
  });

  final String role;

  const RegisterState.updateRole(String role) : this._(role: role);

  @override
  List<Object> get props => [];
}
