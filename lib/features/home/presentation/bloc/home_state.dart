part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List repositories;
  final bool hasReachedEnd;
  final int currentPage;
  final bool isCached;
  final String? errorMessage; // new

  const HomeLoaded({
    required this.repositories,
    required this.hasReachedEnd,
    required this.currentPage,
    this.isCached = false,
    this.errorMessage,
  });

  HomeLoaded copyWith({
    List? repositories,
    bool? hasReachedEnd,
    int? currentPage,
    bool? isCached,
    String? errorMessage,
  }) {
    return HomeLoaded(
      repositories: repositories ?? this.repositories,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
      isCached: isCached ?? this.isCached,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    repositories,
    hasReachedEnd,
    currentPage,
    isCached,
    errorMessage,
  ];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
