import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/features/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<User?> registerUser(String email, String password, String role);
  Future<User?> loginUser(String email, String password);
  Future<void> addUserProfile(UserModel userModel);
  Future<UserModel?> fetchUserProfile(String? userId);
  Future<void> updateUserProfile(UserModel userModel);
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.firestore);

  @override
  Future<User?> loginUser(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<User?> registerUser(String email, String password, String role) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  @override
  Future<void> addUserProfile(UserModel userModel) async {
    return firestore.collection('users').doc(userModel.uuid).set(userModel.toJson());
  }

  @override
  Future<UserModel?> fetchUserProfile(String? userId) async {
    if (userId == null) return null;
    final docSnapShot = await firestore.collection('users').doc(userId).get();
    final docDataMap = docSnapShot.data();

    if (docDataMap == null) return null;
    return UserModel.fromJson(docDataMap);
  }

  @override
  Future<void> updateUserProfile(UserModel userModel) {
    return firestore.collection('users').doc(userModel.uuid).update(userModel.toJson());
  }
}
