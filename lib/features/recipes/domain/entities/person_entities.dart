abstract class PersonEntity {
  const PersonEntity();

  int get id;
  String get name;
  String get status;
  String get species;
  String get type;
  String get gender;
  LocationEntity? get origin;
  LocationEntity? get location;
  String get image;
  List<String> get episode;
  DateTime get created;
  bool get isFavored;
}

class LocationEntity {
  final String name;
  final String url;
  const LocationEntity({required this.name, required this.url});
}
