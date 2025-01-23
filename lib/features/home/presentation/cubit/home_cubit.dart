import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriodsModel = [];
  getHistoricalPeriods() async {
    try {
      emit(HistoricalPeriodsLoading());
      final response =
          await Supabase.instance.client.from('historical_periods').select();

      for (var row in response) {
        historicalPeriodsModel.add(HistoricalPeriodsModel.fromJson(row));
      }
      emit(HistoricalPeriodsSuccess());
    } on Exception catch (e) {
      emit(HistoricalPeriodsFaliure(errMessage: e.toString()));
    }
  }
}
