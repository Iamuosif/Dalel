import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/bazar/data/model/historical_books_model.dart';
import 'package:dalel/features/bazar/data/model/souvenirs_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bazar_state.dart';

class BazarCubit extends Cubit<BazarState> {
  BazarCubit() : super(BazarInitial());
  List<HistoricalBooksModel> booksList = [];
  List<SouvenirsModel> souvenirsList = [];

  Future<void> getHistoricalBooks() async {
    try {
      emit(HistoricalBooksLoading());
      final response = await Supabase.instance.client
          .from(SupabaseString.historicalSouvenirs)
          .select()
          .eq('type', 'book');

      booksList = response
          .map<HistoricalBooksModel>(
              (json) => HistoricalBooksModel.fromJson(json))
          .toList();
      emit(HistoricalBooksSuccess());
    } on Exception catch (e) {
      emit(HistoricalBooksFailure(errMessage: e.toString()));
    }
  }

  Future<void> getSouvenirs() async {
    try {
      emit(SouvenirsLoading());
      final response = await Supabase.instance.client
          .from(SupabaseString.historicalSouvenirs)
          .select()
          .eq('type', 'souvenir');

      souvenirsList = response
          .map<SouvenirsModel>((json) => SouvenirsModel.fromJson(json))
          .toList();
      emit(SouvenirsSuccess());
    } on Exception catch (e) {
      emit(SouvenirsFailure(errMessage: e.toString()));
    }
  }
}
