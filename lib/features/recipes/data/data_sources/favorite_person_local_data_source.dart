import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/features/recipes/data/models/favorite_person_model/favorite_person_model.dart';

import '../../../../drift/app_database.dart';
import '../models/person_model/person_model.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
part 'favorite_person_local_data_source.g.dart';

@lazySingleton
@DriftAccessor(tables: [FavoritePersonModel])
class FavoritePersonLocalDataSource extends DatabaseAccessor<AppDatabase>
    with _$FavoritePersonLocalDataSourceMixin {
  final AppDatabase db;
  FavoritePersonLocalDataSource(this.db) : super(db);

  Future<void> addFavorite(PersonModel person) async {
    Uint8List bytes =
        (await NetworkAssetBundle(
          Uri.parse(person.image),
        ).load(person.image)).buffer.asUint8List();

    await into(favoritePersonModel).insert(person.toFavoriteCompanion(bytes));
  }

  Future<void> removeFavorite(int id) async {
    await (delete(favoritePersonModel)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<PersonModel>> getAllFavorites() async {
    final favoriteDataList = await select(favoritePersonModel).get();
    return favoriteDataList
        .map((data) => PersonModel.fromFavoriteData(data))
        .toList();
  }

  Future<bool> isFavorite(int id) async {
    final favorite =
        await (select(favoritePersonModel)
          ..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return favorite != null;
  }
}
