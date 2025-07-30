import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/drift/app_database.dart';
import 'package:rick_and_morty/features/recipes/data/models/location_model/location_model.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
abstract class PersonModel with _$PersonModel implements PersonEntity {
  const PersonModel._(); // Private constructor for methods

  @JsonSerializable(explicitToJson: true)
  const factory PersonModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)
    LocationModel? origin,
    @JsonKey(fromJson: LocationModel.fromJson, toJson: _locationToJson)
    LocationModel? location,
    required String image,
    required List<String> episode,
    required DateTime created,
    @Default(false) bool isFavored,
  }) = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);
  PersonEntity toEntity() {
    return PersonModel(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin,
      location: location,
      image: image,
      episode: episode,
      created: created,
      isFavored: isFavored,
    );
  }

  static PersonModel fromEntity(PersonEntity entity) {
    return PersonModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type,
      gender: entity.gender,
      origin:
          entity.origin != null
              ? LocationModel.fromEntity(entity.origin!)
              : null,
      location:
          entity.location != null
              ? LocationModel.fromEntity(entity.location!)
              : null,
      image: entity.image,
      episode: List.from(entity.episode),
      created: entity.created,
      isFavored: entity.isFavored,
    );
  }

  @override
  FavoritePersonModelCompanion toFavoriteCompanion(drift.Uint8List imageBytes) {
    return FavoritePersonModelCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      status: drift.Value(status),
      species: drift.Value(species),
      gender: drift.Value(gender),
      location: drift.Value(location?.name ?? 'Unknown'),
      origin: drift.Value(origin?.name ?? 'Unknown'),
      episode: drift.Value(
        episode.join('|'),
      ), // Convert list to pipe-separated string
      image: drift.Value(imageBytes),
      textImage: drift.Value(image), // Store original URL
    );
  }

  static PersonModel fromFavoriteData(FavoritePersonModelData data) {
    return PersonModel(
      id: data.id,
      name: data.name,
      status: data.status ?? 'Unknown',
      species: data.species ?? 'Unknown',
      type: '',
      gender: data.gender ?? 'Unknown',
      origin: LocationModel(name: data.origin ?? 'Unknown', url: ''),
      location: LocationModel(name: data.location ?? 'Unknown', url: ''),
      image: data.textImage ?? '',
      episode: data.episode?.split('|') ?? [],
      created: DateTime.now(),
      isFavored: true,
    );
  }
}

Map<String, dynamic>? _locationToJson(LocationModel? loc) => loc?.toJson();
