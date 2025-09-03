import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:explorer_flutter_app/core/widgets/custome_widgets.dart';
import 'package:explorer_flutter_app/features/home/presentation/widgets/skeleton_card_widget.dart';
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
  bool isOffline = false;
  String _lastQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _checkConnectivityAndFetch('');
  }

  Future<void> _checkConnectivityAndFetch(String query) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() => isOffline = true);
    } else {
      setState(() => isOffline = false);
      _lastQuery = query;
      context.read<HomeBloc>().add(SearchRepositoriesEvent(query));
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HomeBloc>().add(FetchNextPageEvent());
    }
  }

  Future<void> _onRefresh() async {
    await _checkConnectivityAndFetch(_lastQuery);
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
        surfaceTintColor: Colors.transparent,
        title: t18b800('Repositories'),
        actions: const [ThemeSwitch()],
      ),
      body: Column(
        children: [
          HomeSearchBar(
            onChanged: (query) => _checkConnectivityAndFetch(query),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (isOffline) {
                    return const Center(child: Text('You are offline'));
                  } else if (state is HomeLoading) {
                    // Show shimmer loaders
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: 6,
                      itemBuilder: (context, index) =>
                          const RepositoryCardSkeleton(),
                    );
                  } else if (state is HomeLoaded) {
                    return Column(
                      children: [
                        if (state.isCached)
                          Container(
                            color: Colors.orangeAccent,
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              "Showing cached data (offline mode)",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: _onRefresh,
                            child: ListView.builder(
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount:
                                  state.repositories.length +
                                  (state.hasReachedEnd ? 0 : 1),
                              itemBuilder: (context, index) {
                                if (index >= state.repositories.length) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Center(
                                      child: RepositoryCardSkeleton(),
                                    ),
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
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  }
              
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
