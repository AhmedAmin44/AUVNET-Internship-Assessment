import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> getHomeData();
}
