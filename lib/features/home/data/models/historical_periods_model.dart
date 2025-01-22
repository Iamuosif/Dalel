class HistoricalPeriodsModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final Map<String, dynamic> war;

  HistoricalPeriodsModel(this.id,
      {required this.name,
      required this.image,
      required this.description,
      required this.war});
  factory HistoricalPeriodsModel.fromJson(jsonData) {
    return HistoricalPeriodsModel(
      jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
      description: jsonData['description'],
      war: jsonData['war'],
    );
  }
}
