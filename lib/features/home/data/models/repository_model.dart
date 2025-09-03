import '../../domain/entities/repository_entity.dart';

class RepositoryModel extends RepositoryEntity {
  RepositoryModel({
    required super.id,
    required super.name,
    required super.fullName,
    required super.description,
    required super.htmlUrl,
    required super.stargazersCount,
    required super.language,
    required super.ownerLogin,
    required super.ownerAvatarUrl,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    final owner = json['owner'] ?? {};
    return RepositoryModel(
      id: json['id'],
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      description: json['description'] ?? '',
      htmlUrl: json['html_url'] ?? '',
      stargazersCount: json['stargazers_count'] ?? 0,
      language: json['language'] ?? '',
      ownerLogin: owner['login'] ?? '',
      ownerAvatarUrl: owner['avatar_url'] ?? '',
    );
  }
}
