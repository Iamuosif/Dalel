import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/wars_model.dart';

class HistoricalPeriodsModel extends DataModel {
  final List<WarsModel> wars;

  HistoricalPeriodsModel(super.id,
      {required super.name,
      required super.image,
      required super.description,
      required this.wars});
  factory HistoricalPeriodsModel.fromJson(jsonData, warsList) {
    return HistoricalPeriodsModel(
      jsonData['id'],
      name: jsonData[SupabaseString.name],
      image: jsonData[SupabaseString.image],
      description: jsonData[SupabaseString.description],
      wars: warsList,
    );
  }
}
