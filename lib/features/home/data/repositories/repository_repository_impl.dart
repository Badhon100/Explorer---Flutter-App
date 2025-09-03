// features/home/data/repositories/repository_repository_impl.dart
import 'package:explorer_flutter_app/features/home/data/datasources/repository_local_datasource.dart';
import 'package:explorer_flutter_app/features/home/data/datasources/repository_remote_datasource.dart';
import 'package:explorer_flutter_app/features/home/domain/repositories/repository_repository.dart';
import '../../domain/entities/repository_entity.dart';
import '../models/repository_model.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  final RepositoryRemoteDataSource remoteDataSource;
  final RepositoryLocalDataSource localDataSource;

  RepositoryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<RepositoryEntity>> searchRepositories({
    required String query,
    required int page,
    int perPage = 20,
  }) async {
    try {
      final repositories = await remoteDataSource.searchRepositories(
        query: query,
        page: page,
        perPage: perPage,
      );

      // Only cache first page
      if (page == 1) {
        await localDataSource.cacheRepositories(
          query,
          repositories.cast<RepositoryModel>(),
        );
      }

      return repositories;
    } catch (_) {
      // Fallback to cached data if available
      if (page == 1) {
        final cachedRepos = await localDataSource.getCachedRepositories(query);
        if (cachedRepos != null) {
          return cachedRepos;
        }
      }
      rethrow;
    }
  }
}
