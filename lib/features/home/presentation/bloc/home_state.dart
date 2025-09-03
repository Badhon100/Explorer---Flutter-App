part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

/// Initial state
class HomeInitial extends HomeState {}

/// Loading state for first page
class HomeLoading extends HomeState {}

/// State when data is loaded
class HomeLoaded extends HomeState {
  final List repositories;
  final bool hasReachedEnd;
  final int currentPage;

  const HomeLoaded({
    required this.repositories,
    required this.hasReachedEnd,
    required this.currentPage,
  });

  HomeLoaded copyWith({
    List? repositories,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return HomeLoaded(
      repositories: repositories ?? this.repositories,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [repositories, hasReachedEnd, currentPage];
}

/// Error state
class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
