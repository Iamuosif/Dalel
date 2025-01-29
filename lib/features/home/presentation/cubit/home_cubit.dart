import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/data/models/wars_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriodsModel = [];
  List<WarsModel> warsList = [];

  Future<List<WarsModel>> getWars(String historicalPeriodId) async {
    try {
      emit(WarsLoading());
      final response = await Supabase.instance.client
          .from(SupabaseString.wars)
          .select()
          .eq('historical_period_id',
              historicalPeriodId); // Filter by period ID

      return response.map<WarsModel>((row) => WarsModel.fromJson(row)).toList();
    } on Exception catch (e) {
      emit(WarsFaliure(errMessage: e.toString()));
      return [];
    }
  }

  Future<void> getHistoricalPeriods() async {
    try {
      emit(HistoricalPeriodsLoading());

      final response = await Supabase.instance.client
          .from(SupabaseString.histroicalPeriods)
          .select()
          .order('name', ascending: true);

      for (var row in response) {
        // Fetch wars for the current period
        final wars = await getWars(row['id']); // Assume 'id' is the period ID
        historicalPeriodsModel.add(HistoricalPeriodsModel.fromJson(row, wars));
      }

      emit(HistoricalPeriodsSuccess());
    } on Exception catch (e) {
      emit(HistoricalPeriodsFaliure(errMessage: e.toString()));
    }
  }
}
