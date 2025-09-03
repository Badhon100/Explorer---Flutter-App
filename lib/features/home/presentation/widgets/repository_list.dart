import 'package:flutter/material.dart';
import 'repository_card.dart';

class RepositoryList extends StatelessWidget {
  final List<Map<String, dynamic>> repositories;
  const RepositoryList({super.key, required this.repositories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          final repo = repositories[index];
          return RepositoryCard(
            name: repo['name'],
            username: repo['username'],
            description: repo['description'],
            stars: repo['stars'],
          );
        },
      ),
    );
  }
}
