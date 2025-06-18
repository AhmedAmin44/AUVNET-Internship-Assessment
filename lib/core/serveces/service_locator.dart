import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_home_data_usecase.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../connection/network_info.dart';
import '../databases/cache/cache_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(DataConnectionChecker()),
  );

  // Firebase
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  // Home Feature
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(Hive.box('home')),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remote: getIt<HomeRemoteDataSource>(),
      local: getIt<HomeLocalDataSource>(),
      network: getIt<NetworkInfo>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetHomeDataUseCase(getIt<HomeRepository>()),
  );

  getIt.registerFactory(() => HomeBloc(getIt<GetHomeDataUseCase>()));
}
