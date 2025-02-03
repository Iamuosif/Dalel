import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class HistoricalBooksModel extends DataModel {
  HistoricalBooksModel(
    super.id, {
    required super.name,
    required super.image,
    required super.description,
  });

  factory HistoricalBooksModel.fromJson(jsonData) {
    return HistoricalBooksModel(jsonData['id'],
        name: jsonData[SupabaseString.name],
        image: jsonData[SupabaseString.image],
        description: jsonData[SupabaseString.description]);
  }
}
