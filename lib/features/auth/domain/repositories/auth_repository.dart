import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(String email, String password);
Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(String email, String password);

}
