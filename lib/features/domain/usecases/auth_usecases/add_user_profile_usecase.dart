import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/core/utils/usecase.dart';
import 'package:renting_bd/features/data/models/user_model.dart';
import 'package:renting_bd/features/domain/repositories/auth_repository.dart';

@Injectable()
class AddUserProfileUseCase implements UseCase<void, UserModel> {
  final AuthRepository authRepository;

  AddUserProfileUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(UserModel userModel) {
    return authRepository.addUserProfile(userModel);
  }
}
