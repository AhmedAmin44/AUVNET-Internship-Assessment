import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
