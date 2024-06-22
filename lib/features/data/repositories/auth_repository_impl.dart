import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/features/data/data_sources/auth_remote_data_source.dart';
import 'package:renting_bd/features/data/models/user_model.dart';
import 'package:renting_bd/features/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, void>> addUserProfile(UserModel userModel) async {
    try {
      await authRemoteDataSource.addUserProfile(userModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, User?>> loginUser(String email, String password) async {
    try {
      final user = await authRemoteDataSource.loginUser(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, User?>> registerUser(String email, String password, String role) async {
    try {
      final user = await authRemoteDataSource.registerUser(email, password, role);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure());
    }
  }
}
