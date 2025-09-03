import 'package:explorer_flutter_app/core/widgets/custome_widgets.dart';
import 'package:explorer_flutter_app/features/home/presentation/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../widgets/repository_card.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HomeBloc>().add(FetchNextPageEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: t18b800('Repositories'),
        actions: const [ThemeSwitch()],
      ),
      body: Column(
        children: [
          HomeSearchBar(
            onChanged: (query) {
              context.read<HomeBloc>().add(SearchRepositoriesEvent(query));
            },
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        state.repositories.length +
                        (state.hasReachedEnd ? 0 : 1),
                    itemBuilder: (context, index) {
                      if (index >= state.repositories.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final repo = state.repositories[index];
                      return RepositoryCard(
                        name: repo.name,
                        username: repo.ownerLogin,
                        description: repo.description,
                        stars: repo.stargazersCount,
                      );
                    },
                  );
                } else if (state is HomeError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
