import 'package:drift/drift.dart';

class FavoritePersonModel extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get status => text().nullable()();
  TextColumn get species => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get origin => text().nullable()();
  TextColumn get episode => text().nullable()();
  BlobColumn get image => blob()();
  TextColumn get textImage => text().nullable()();
}
