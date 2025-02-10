part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchResultsLoaded extends SearchState {}

class SearchError extends SearchState {
  final String error;

  SearchError(this.error);
}
