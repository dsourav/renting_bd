import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renting_bd/core/utils/failure.dart';
import 'package:renting_bd/features/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> registerUser(String email, String password, String role);
  Future<Either<Failure, User?>> loginUser(String email, String password);
  Future<Either<Failure, void>> addUserProfile(UserModel userModel);
  Future<Either<Failure, UserModel?>> fetchUserProfile(String? userId);
  Future<Either<Failure, void>> updateUserProfile(UserModel userModel);
}
