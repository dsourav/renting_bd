import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:renting_bd/features/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<User?> registerUser(String email, String password, String role);
  Future<User?> loginUser(String email, String password);
  Future<void> addUserProfile(UserModel userModel);
  Future<UserModel?> fetchUserProfile();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.firestore);

  @override
  Future<User?> loginUser(String email, String password) async {
    // try {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
    // } on FirebaseAuthException catch (e) {
    //   throw ServerException(message: e.message);
    // } catch (e) {
    //   throw ServerException();
    // }
  }

  @override
  Future<User?> registerUser(String email, String password, String role) async {
    // try {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    return userCredential.user;
    // } on FirebaseAuthException catch (e) {
    //   throw ServerException(message: e.message);
    // } catch (e) {
    //   throw ServerException();
    // }
  }

  @override
  Future<void> addUserProfile(UserModel userModel) async {
    // try {
    return firestore.collection('users').doc(userModel.uuid).set(userModel.toJson());
    // } catch (e) {
    //   throw ServerException();
    // }
  }

  @override
  Future<UserModel?> fetchUserProfile() async {
    final userId = firebaseAuth.currentUser?.uid;
    if (userId == null) return null;

    final docSnapShot = await firestore.collection('users').doc(userId).get();
    final docDataMap = docSnapShot.data();

    if (docDataMap == null) return null;
    return UserModel.fromJson(docDataMap);
  }
}
