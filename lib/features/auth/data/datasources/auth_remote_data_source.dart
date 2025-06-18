import 'package:auvnet_internship_assessment/core/errors/expentions.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User> signInWithEmailAndPassword(String email, String password);

  Future<User>signUpWithEmailAndPassword(String email, String password) ;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user!;
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
      rethrow;
    }
  }

  @override
  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user!.sendEmailVerification(); 
      return result.user!;
    } on FirebaseAuthException catch (e) {
      handleFirebaseAuthException(e);
      rethrow;
    }
  }
}
