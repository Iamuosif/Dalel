import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class HistoricalCharactersModel extends DataModel {
  HistoricalCharactersModel(
    super.id, {
    required super.name,
    required super.image,
    required super.description,
  });
  factory HistoricalCharactersModel.fromJson(jsonData) {
    return HistoricalCharactersModel(
      jsonData['id'],
      name: jsonData[SupabaseString.name],
      image: jsonData[SupabaseString.image],
      description: jsonData[SupabaseString.description],
    );
  }
}
