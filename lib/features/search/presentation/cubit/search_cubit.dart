import 'package:dalel/features/bazar/presentation/cubit/bazar_cubit.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/search/data/model/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<List<SearchItem>> {
  final HomeCubit homeCubit;
  final BazarCubit bazarCubit;

  SearchCubit(this.homeCubit, this.bazarCubit) : super([]);

  void loadAllData() {
    final List<SearchItem> allData = [];

    // Add Characters
    for (var character in homeCubit.charactersList) {
      allData.add(SearchItem(
          title: character.name, data: character, type: SearchType.character));
    }

    // Add Wars
    for (var war in homeCubit.warsList) {
      allData.add(SearchItem(title: war.name, data: war, type: SearchType.war));
    }

    // Add Periods
    for (var period in homeCubit.historicalPeriodsModel) {
      allData.add(SearchItem(
          title: period.name, data: period, type: SearchType.period));
    }

    // Add Souvenirs
    for (var souvenir in homeCubit.souvenirsList) {
      allData.add(SearchItem(
          title: souvenir.name, data: souvenir, type: SearchType.souvenir));
    }

    // Add Books
    for (var book in bazarCubit.booksList) {
      allData
          .add(SearchItem(title: book.name, data: book, type: SearchType.book));
    }
    emit(allData);
  }

  void search(String query) {
    if (query.isEmpty) {
      emit([]);
      return;
    }

    final results = state
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(results);
  }
}
