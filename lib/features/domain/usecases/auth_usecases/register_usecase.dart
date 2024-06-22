import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/core/utils/usecase.dart';
import 'package:renting_bd/features/domain/repositories/auth_repository.dart';

@Injectable()
class RegisterUseCase implements UseCase<User?, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, User?>> call(RegisterParams params) {
    return authRepository.registerUser(params.email, params.password, params.role);
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String role;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [email, password, role];
}
