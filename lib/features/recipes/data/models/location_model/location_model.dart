import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/features/recipes/domain/entities/person_entities.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
abstract class LocationModel with _$LocationModel implements LocationEntity {
  const factory LocationModel({required String name, required String url}) =
      _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  static LocationModel fromEntity(LocationEntity entity) {
    return LocationModel(name: entity.name, url: entity.url);
  }
}
