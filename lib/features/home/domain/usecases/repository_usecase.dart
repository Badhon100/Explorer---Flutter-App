import 'package:explorer_flutter_app/features/home/domain/repositories/repository_repository.dart';

import '../entities/repository_entity.dart';

class GetRepositoriesUseCase {
  final RepositoryRepository repository;

  GetRepositoriesUseCase(this.repository);

  Future<List<RepositoryEntity>> call({
    required String query,
    required int page,
    int perPage = 50,
  }) {
    return repository.searchRepositories(
      query: query,
      page: page,
      perPage: perPage,
    );
  }
}
