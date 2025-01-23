part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HistoricalPeriodsSuccess extends HomeState {}

final class HistoricalPeriodsFaliure extends HomeState {
  final String errMessage;

  HistoricalPeriodsFaliure({required this.errMessage});
}

final class HistoricalPeriodsLoading extends HomeState {}
