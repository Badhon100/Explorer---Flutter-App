// core/di/injection.dart
import 'package:explorer_flutter_app/core/const/api_constant.dart';
import 'package:explorer_flutter_app/core/service/api_servie.dart';
import 'package:explorer_flutter_app/features/home/data/datasources/repository_local_datasource.dart';
import 'package:explorer_flutter_app/features/home/data/datasources/repository_remote_datasource.dart';
import 'package:explorer_flutter_app/features/home/data/repositories/repository_repository_impl.dart';
import 'package:explorer_flutter_app/features/home/domain/repositories/repository_repository.dart';
import 'package:explorer_flutter_app/features/home/domain/usecases/repository_usecase.dart';
import 'package:explorer_flutter_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_cubit.dart';
import '../theme/theme_repository.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  // Theme
  sl.registerLazySingleton(() => ThemeRepository(sl()));
  sl.registerFactory(() => ThemeCubit(sl()));

  // Core
  sl.registerLazySingleton(
    () => ApiService(baseUrl: ApiConstants.baseUrl),
  );

  // Data Layer
  sl.registerLazySingleton<RepositoryRemoteDataSource>(
    () => RepositoryRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<RepositoryLocalDataSource>(
    () => RepositoryLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<RepositoryRepository>(() => RepositoryRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()));

  // Domain Layer
  sl.registerLazySingleton(() => GetRepositoriesUseCase(sl()));

  // Presentation Layer (Bloc)
  sl.registerFactory(() => HomeBloc(getRepositoriesUseCase: sl()));
}
