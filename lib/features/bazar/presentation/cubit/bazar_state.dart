part of 'bazar_cubit.dart';

sealed class BazarState {}

final class BazarInitial extends BazarState {}

final class HistoricalBooksSuccess extends BazarState {}

final class HistoricalBooksFailure extends BazarState {
  final String errMessage;

  HistoricalBooksFailure({required this.errMessage});
}

final class HistoricalBooksLoading extends BazarState {}

final class SouvenirsSuccess extends BazarState {}

final class SouvenirsFailure extends BazarState {
  final String errMessage;

  SouvenirsFailure({required this.errMessage});
}

final class SouvenirsLoading extends BazarState {}
