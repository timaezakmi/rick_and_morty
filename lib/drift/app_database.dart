import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:rick_and_morty/features/recipes/data/data_sources/favorite_person_local_data_source.dart';
import 'package:rick_and_morty/features/recipes/data/models/favorite_person_model/favorite_person_model.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [FavoritePersonModel],
  daos: [FavoritePersonLocalDataSource],
)
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}

//dart run build_runner build
