import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

class GetHomeDataUseCase {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  Future<Either<Failure, HomeEntity>> call() {
    return repository.getHomeData();
  }
}
