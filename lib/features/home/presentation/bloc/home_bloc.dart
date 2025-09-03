import 'package:explorer_flutter_app/features/home/domain/usecases/repository_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRepositoriesUseCase getRepositoriesUseCase;

  String currentQuery = '';
  bool isFetching = false;

  HomeBloc({required this.getRepositoriesUseCase}) : super(HomeInitial()) {
    on<SearchRepositoriesEvent>(_onSearchRepositories);
    on<FetchNextPageEvent>(_onFetchNextPage);
  }

  Future<void> _onSearchRepositories(
    SearchRepositoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    currentQuery = event.query;
    if (currentQuery.isEmpty) return;

    emit(HomeLoading());

    try {
      final repositories = await getRepositoriesUseCase(
        query: currentQuery,
        page: 1,
      );

      emit(
        HomeLoaded(
          repositories: repositories,
          hasReachedEnd: repositories.length < 20,
          currentPage: 1,
        ),
      );
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onFetchNextPage(
    FetchNextPageEvent event,
    Emitter<HomeState> emit,
  ) async {
    final stateNow = state;
    if (stateNow is HomeLoaded && !stateNow.hasReachedEnd && !isFetching) {
      isFetching = true;
      final nextPage = stateNow.currentPage + 1;

      try {
        final repositories = await getRepositoriesUseCase(
          query: currentQuery,
          page: nextPage,
        );

        emit(
          stateNow.copyWith(
            repositories: [...stateNow.repositories, ...repositories],
            hasReachedEnd: repositories.length < 20,
            currentPage: nextPage,
          ),
        );
      } catch (e) {
        emit(HomeError(e.toString()));
      } finally {
        isFetching = false;
      }
    }
  }
}
