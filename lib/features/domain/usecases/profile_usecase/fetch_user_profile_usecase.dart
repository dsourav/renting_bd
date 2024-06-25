import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/core/utils/usecase.dart';
import 'package:renting_bd/features/data/models/user_model.dart';
import 'package:renting_bd/features/domain/repositories/auth_repository.dart';

@Injectable()
class FetchUserProfileUseCase implements UseCase<UserModel?, FetUserProfileParams> {
  final AuthRepository authRepository;

  FetchUserProfileUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserModel?>> call(FetUserProfileParams params) {
    return authRepository.fetchUserProfile(params.userId);
  }
}

class FetUserProfileParams extends Equatable {
  final String? userId;

  const FetUserProfileParams({this.userId});

  @override
  List<Object?> get props => [userId];
}
