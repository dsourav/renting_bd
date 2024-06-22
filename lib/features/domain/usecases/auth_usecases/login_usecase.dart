import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/core/utils/usecase.dart';
import 'package:renting_bd/features/domain/repositories/auth_repository.dart';

@Injectable()
class LoginUseCase implements UseCase<User?, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, User?>> call(LoginParams params) {
    return authRepository.loginUser(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
