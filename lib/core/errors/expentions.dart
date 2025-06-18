import 'package:firebase_auth/firebase_auth.dart';
import 'error_model.dart';

/// Main Server Exception used across the app
class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}

/// Firebase Specific Exception
class FirebaseAuthServerException extends ServerException {
  FirebaseAuthServerException(super.errorModel);
}

/// Dio-Based ServerException (لو رجعتله)
class DioServerException extends ServerException {
  DioServerException(super.errorModel);
}

/// No-Cache Exception
class CacheException implements Exception {
  final String errorMessage;

  CacheException({required this.errorMessage});
}

/// Central handler for FirebaseAuth errors
void handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, 'Invalid email address.'));
    case 'user-disabled':
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, 'This user has been disabled.'));
    case 'user-not-found':
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, 'User not found.'));
    case 'wrong-password':
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, 'Wrong password.'));
    case 'email-already-in-use':
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, 'Email already in use.'));
    case 'operation-not-allowed':
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, 'Operation not allowed.'));
    case 'weak-password':
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, 'Password is too weak.'));
    default:
      throw FirebaseAuthServerException(ErrorModel.fromFirebase(e.code, e.message ?? 'Unknown error'));
  }
}
