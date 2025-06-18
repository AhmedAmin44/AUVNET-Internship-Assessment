import 'package:dartz/dartz.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';


class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;
  final HomeLocalDataSource local;
  final NetworkInfo network;

  HomeRepositoryImpl({
    required this.remote,
    required this.local,
    required this.network,
  });

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    if (await network.isConnected!) {
      try {
        final model = await remote.fetchHomeData();
        await local.cacheHomeData(model);
        return Right(model);
      } catch (e) {
        return Left(ServerFailure(errMessage: 'Server error: ${e.toString()}'));
      }
    } else {
      final cached = local.getCachedHomeData();
      if (cached != null) {
        return Right(cached);
      }
      return Left(CacheFailure(errMessage: 'No cached data found'));
    }
  }
}
