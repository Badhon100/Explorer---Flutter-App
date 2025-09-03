import '../entities/repository_entity.dart';

abstract class RepositoryRepository {
  Future<List<RepositoryEntity>> searchRepositories({
    required String query,
    required int page,
    int perPage = 50,
  });
}
