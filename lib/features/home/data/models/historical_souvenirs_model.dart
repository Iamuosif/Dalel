import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class HistoricalSouvenirsModel extends DataModel {
  HistoricalSouvenirsModel(
    super.id, {
    required super.name,
    required super.image,
    required super.description,
  });
  factory HistoricalSouvenirsModel.fromJson(jsonData) {
    return HistoricalSouvenirsModel(
      jsonData['id'],
      name: jsonData[SupabaseString.name],
      image: jsonData[SupabaseString.image],
      description: jsonData[SupabaseString.description],
    );
  }
}
