import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kitabi/core/utils/api/api_consumer.dart';
import 'package:kitabi/core/utils/api/dio_consumer.dart';
import 'package:kitabi/features/home/data/repos/home_repo.dart';
import 'package:kitabi/features/home/data/repos/homr_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  /// Dio (Singleton)
  getIt.registerLazySingleton<Dio>(() => Dio());

  /// ApiConsumer
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );

  /// HomeRepo
  getIt.registerLazySingleton<HomeRepo>(
    () => HomrRepoImpl(api: getIt<ApiConsumer>()),
  );
}
