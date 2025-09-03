import 'package:explorer_flutter_app/features/home/data/datasources/repository_remote_datasource.dart';
import 'package:explorer_flutter_app/features/home/domain/repositories/repository_repository.dart';

import '../../domain/entities/repository_entity.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  final RepositoryRemoteDataSource remoteDataSource;

  RepositoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<RepositoryEntity>> searchRepositories({
    required String query,
    required int page,
    int perPage = 50,
  }) async {
    return await remoteDataSource.searchRepositories(
      query: query,
      page: page,
      perPage: perPage,
    );
  }
}
