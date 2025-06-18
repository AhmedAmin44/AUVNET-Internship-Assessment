import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import 'package:auvnet_internship_assessment/core/errors/expentions.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected!) {
      try {
        final user = await remoteDataSource.signInWithEmailAndPassword(
          email,
          password,
        );
        return Right(UserModel.fromFirebaseUser(user));
      } on FirebaseAuthException catch (e) {
        handleFirebaseAuthException(
          e,
        ); // will throw FirebaseAuthServerException
        return Left(
          ServerFailure(errMessage: "Unhandled Auth Error"),
        ); // fallback
      } on FirebaseAuthServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      // If no internet connection, return a ConnectionFailure
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected!) {
      try {
        final user = await remoteDataSource.signUpWithEmailAndPassword(
          email,
          password,
        );
        return Right(UserModel.fromFirebaseUser(user));
      } on FirebaseAuthException catch (e) {
        handleFirebaseAuthException(
          e,
        ); // will throw FirebaseAuthServerException
        return Left(ServerFailure(errMessage: "Unhandled sign up error"));
      } on FirebaseAuthServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
