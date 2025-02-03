import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class CharacterWars extends DataModel {
  final String characterId;
  CharacterWars(super.id, this.characterId,
      {required super.name, required super.image, required super.description});
  factory CharacterWars.fromJson(jsonData) {
    return CharacterWars(jsonData['id'], jsonData[SupabaseString.characterId],
        name: jsonData[SupabaseString.name],
        image: jsonData[SupabaseString.image],
        description: jsonData[SupabaseString.description]);
  }
}
