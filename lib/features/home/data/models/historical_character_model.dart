import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/character_wars.dart';

class HistoricalCharactersModel extends DataModel {
  final List<CharacterWars> wars;
  HistoricalCharactersModel(super.id,
      {required super.name,
      required super.image,
      required super.description,
      required this.wars});
  factory HistoricalCharactersModel.fromJson(jsonData, warsList) {
    return HistoricalCharactersModel(
      jsonData['id'],
      name: jsonData[SupabaseString.name],
      image: jsonData[SupabaseString.image],
      wars: warsList,
      description: jsonData[SupabaseString.description],
    );
  }
}
