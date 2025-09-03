import 'package:explorer_flutter_app/core/const/dummy_data.dart';
import 'package:explorer_flutter_app/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/repository_list.dart';
import '../widgets/theme_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  final repositories = List.generate(
    10,
    (index) => {
      'name': 'Repository name',
      'username': 'username',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'stars': 500,
    },
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
        actions: const [ThemeSwitch()],
      ),
      body: Column(
        children: [
          HomeSearchBar(onChanged: (value) => setState(() => query = value)),
          RepositoryList(repositories: dummyRepositories),
        ],
      ),
    );
  }
}
