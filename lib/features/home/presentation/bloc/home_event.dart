part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

/// Triggered when user types a new search query
class SearchRepositoriesEvent extends HomeEvent {
  final String query;

  const SearchRepositoriesEvent(this.query);

  @override
  List<Object> get props => [query];
}

/// Triggered when scrolling to bottom to fetch next page
class FetchNextPageEvent extends HomeEvent {}
