import 'package:explorer_flutter_app/core/const/api_constant.dart';
import 'package:explorer_flutter_app/core/service/api_servie.dart';

import '../models/repository_model.dart';

abstract class RepositoryRemoteDataSource {
  Future<List<RepositoryModel>> searchRepositories({
    required String query,
    required int page,
    int perPage,
  });
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final ApiService apiService;

  RepositoryRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<RepositoryModel>> searchRepositories({
    required String query,
    required int page,
    int perPage = 20,
  }) async {
    final response = await apiService.get(
      ApiConstants.searchRepositories,
      queryParams: {'q': query, 'per_page': perPage, 'page': page, 'sort':'stars', 'order': 'des'},
    );

    final items = response['items'] as List<dynamic>;
    return items.map((e) => RepositoryModel.fromJson(e)).toList();
  }
}
