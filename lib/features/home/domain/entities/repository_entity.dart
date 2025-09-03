class RepositoryEntity {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final String htmlUrl;
  final int stargazersCount;
  final String language;
  final String ownerLogin;
  final String ownerAvatarUrl;
  final int forksCount;

  RepositoryEntity({
    required this.id,
    required this.forksCount,
    required this.name,
    required this.fullName,
    required this.description,
    required this.htmlUrl,
    required this.stargazersCount,
    required this.language,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
  });
}
