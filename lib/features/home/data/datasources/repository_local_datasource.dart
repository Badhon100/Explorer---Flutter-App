// features/home/data/datasources/repository_local_data_source.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/repository_model.dart';

abstract class RepositoryLocalDataSource {
  Future<void> cacheRepositories(String query, List<RepositoryModel> repos);
  Future<List<RepositoryModel>?> getCachedRepositories(String query);
}

class RepositoryLocalDataSourceImpl implements RepositoryLocalDataSource {
  final SharedPreferences prefs;

  RepositoryLocalDataSourceImpl(this.prefs);

  @override
  Future<void> cacheRepositories(
    String query,
    List<RepositoryModel> repos,
  ) async {
    final key = 'repos_$query';
    final jsonString = jsonEncode(repos.map((e) => e.toJson()).toList());
    await prefs.setString(key, jsonString);
  }

  @override
  Future<List<RepositoryModel>?> getCachedRepositories(String query) async {
    final key = 'repos_$query';
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((e) => RepositoryModel.fromJson(e)).toList();
  }
}
