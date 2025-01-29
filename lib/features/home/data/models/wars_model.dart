import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class WarsModel extends DataModel {
  final String historicalPeriodsId;
  WarsModel(super.id, this.historicalPeriodsId,
      {required super.name, required super.image, required super.description});
  factory WarsModel.fromJson(jsonData) {
    return WarsModel(
        jsonData['id'], jsonData[SupabaseString.historicalPeriodsId],
        name: jsonData[SupabaseString.name],
        image: jsonData[SupabaseString.image],
        description: jsonData[SupabaseString.description]);
  }
}
