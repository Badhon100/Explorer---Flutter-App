import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:explorer_flutter_app/core/widgets/custome_widgets.dart';
import 'package:explorer_flutter_app/features/home/presentation/pages/details_page.dart';
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

  late final StreamSubscription<List<ConnectivityResult>>
  _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Listen to connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      results,
    ) {
      // Get the first result (or decide based on your logic)
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;
      final offline = result == ConnectivityResult.none;

      if (offline != isOffline) {
        setState(() => isOffline = offline);
      }

      // Fetch data automatically when back online
      if (!offline && _lastQuery.isNotEmpty) {
        context.read<HomeBloc>().add(SearchRepositoriesEvent(_lastQuery));
      }
    });

    _checkConnectivityAndFetch('');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkConnectivityAndFetch(String query) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final offline = connectivityResult == ConnectivityResult.none;
    setState(() => isOffline = offline);

    if (!offline) {
      _lastQuery = query;
      context.read<HomeBloc>().add(SearchRepositoriesEvent(query));
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (isOffline) return;
      context.read<HomeBloc>().add(FetchNextPageEvent());
    }
  }

  Future<void> _onRefresh() async {
    if (isOffline) return;
    await _checkConnectivityAndFetch(_lastQuery);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: t18b800('Repositories'),
        actions: const [ThemeSwitch()],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              HomeSearchBar(
                onChanged: (query) => _checkConnectivityAndFetch(query),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: BlocListener<HomeBloc, HomeState>(
                    listener: (context, state) {
                      if (state is HomeLoaded && state.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Something went wrong! Please try again."),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoading) {
                          return ListView.builder(
                            controller: _scrollController,
                            itemCount: 6,
                            itemBuilder: (context, index) =>
                                const RepositoryCardSkeleton(),
                          );
                        } else if (state is HomeLoaded) {
                          return ListView.builder(
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
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RepositoryDetailsPage
                                      (
                                        avatarUrl: repo.ownerAvatarUrl,
                                        name: repo.name,
                                        username: repo.ownerLogin,
                                        description: repo.description,
                                        stars: repo.stargazersCount,
                                        forks: repo.forksCount,
                                        repoUrl: repo.htmlUrl,
                                      ),
                                    ),
                                  );
                                },
                                child: RepositoryCard(
                                  name: repo.name,
                                  username: repo.ownerLogin,
                                  description: repo.description,
                                  stars: repo.stargazersCount,
                                ),
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isOffline)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.redAccent,
                padding: const EdgeInsets.all(8),
                child: const Text(
                  "You are currently offline",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
