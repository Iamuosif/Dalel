import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class SouvenirsModel extends DataModel {
  SouvenirsModel(
    super.id, {
    required super.name,
    required super.image,
    required super.description,
  });

  factory SouvenirsModel.fromJson(jsonData) {
    return SouvenirsModel(jsonData['id'],
        name: jsonData[SupabaseString.name],
        image: jsonData[SupabaseString.image],
        description: jsonData[SupabaseString.description]);
  }
}
