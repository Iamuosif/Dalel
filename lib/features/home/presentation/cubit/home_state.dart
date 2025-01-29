part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HistoricalPeriodsSuccess extends HomeState {}

final class HistoricalPeriodsFaliure extends HomeState {
  final String errMessage;

  HistoricalPeriodsFaliure({required this.errMessage});
}

final class HistoricalPeriodsLoading extends HomeState {}

final class WarsSuccess extends HomeState {}

final class WarsFaliure extends HomeState {
  final String errMessage;

  WarsFaliure({required this.errMessage});
}

final class WarsLoading extends HomeState {}

final class HistoricalCharactersSuccess extends HomeState {}

final class HistoricalCharactersFailiure extends HomeState {
  final String errMessage;

  HistoricalCharactersFailiure({required this.errMessage});
}

final class HistoricalCharactersLoading extends HomeState {}

final class HistoricalSouvenirsSuccess extends HomeState {}

final class HistoricalSouvenirsFailiure extends HomeState {
  final String errMessage;

  HistoricalSouvenirsFailiure({required this.errMessage});
}

final class HistoricalSouvenirsLoading extends HomeState {}
