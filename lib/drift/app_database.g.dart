// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoritePersonModelTable extends FavoritePersonModel
    with TableInfo<$FavoritePersonModelTable, FavoritePersonModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritePersonModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _episodeMeta = const VerificationMeta(
    'episode',
  );
  @override
  late final GeneratedColumn<String> episode = GeneratedColumn<String>(
    'episode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<Uint8List> image = GeneratedColumn<Uint8List>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textImageMeta = const VerificationMeta(
    'textImage',
  );
  @override
  late final GeneratedColumn<String> textImage = GeneratedColumn<String>(
    'text_image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    status,
    species,
    gender,
    location,
    origin,
    episode,
    image,
    textImage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_person_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoritePersonModelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    }
    if (data.containsKey('episode')) {
      context.handle(
        _episodeMeta,
        episode.isAcceptableOrUnknown(data['episode']!, _episodeMeta),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('text_image')) {
      context.handle(
        _textImageMeta,
        textImage.isAcceptableOrUnknown(data['text_image']!, _textImageMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FavoritePersonModelData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoritePersonModelData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      species: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}species'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      ),
      episode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}episode'],
      ),
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.blob,
            data['${effectivePrefix}image'],
          )!,
      textImage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_image'],
      ),
    );
  }

  @override
  $FavoritePersonModelTable createAlias(String alias) {
    return $FavoritePersonModelTable(attachedDatabase, alias);
  }
}

class FavoritePersonModelData extends DataClass
    implements Insertable<FavoritePersonModelData> {
  final int id;
  final String name;
  final String? status;
  final String? species;
  final String? gender;
  final String? location;
  final String? origin;
  final String? episode;
  final Uint8List image;
  final String? textImage;
  const FavoritePersonModelData({
    required this.id,
    required this.name,
    this.status,
    this.species,
    this.gender,
    this.location,
    this.origin,
    this.episode,
    required this.image,
    this.textImage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || species != null) {
      map['species'] = Variable<String>(species);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || episode != null) {
      map['episode'] = Variable<String>(episode);
    }
    map['image'] = Variable<Uint8List>(image);
    if (!nullToAbsent || textImage != null) {
      map['text_image'] = Variable<String>(textImage);
    }
    return map;
  }

  FavoritePersonModelCompanion toCompanion(bool nullToAbsent) {
    return FavoritePersonModelCompanion(
      id: Value(id),
      name: Value(name),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      species:
          species == null && nullToAbsent
              ? const Value.absent()
              : Value(species),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      location:
          location == null && nullToAbsent
              ? const Value.absent()
              : Value(location),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      episode:
          episode == null && nullToAbsent
              ? const Value.absent()
              : Value(episode),
      image: Value(image),
      textImage:
          textImage == null && nullToAbsent
              ? const Value.absent()
              : Value(textImage),
    );
  }

  factory FavoritePersonModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoritePersonModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String?>(json['status']),
      species: serializer.fromJson<String?>(json['species']),
      gender: serializer.fromJson<String?>(json['gender']),
      location: serializer.fromJson<String?>(json['location']),
      origin: serializer.fromJson<String?>(json['origin']),
      episode: serializer.fromJson<String?>(json['episode']),
      image: serializer.fromJson<Uint8List>(json['image']),
      textImage: serializer.fromJson<String?>(json['textImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String?>(status),
      'species': serializer.toJson<String?>(species),
      'gender': serializer.toJson<String?>(gender),
      'location': serializer.toJson<String?>(location),
      'origin': serializer.toJson<String?>(origin),
      'episode': serializer.toJson<String?>(episode),
      'image': serializer.toJson<Uint8List>(image),
      'textImage': serializer.toJson<String?>(textImage),
    };
  }

  FavoritePersonModelData copyWith({
    int? id,
    String? name,
    Value<String?> status = const Value.absent(),
    Value<String?> species = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> origin = const Value.absent(),
    Value<String?> episode = const Value.absent(),
    Uint8List? image,
    Value<String?> textImage = const Value.absent(),
  }) => FavoritePersonModelData(
    id: id ?? this.id,
    name: name ?? this.name,
    status: status.present ? status.value : this.status,
    species: species.present ? species.value : this.species,
    gender: gender.present ? gender.value : this.gender,
    location: location.present ? location.value : this.location,
    origin: origin.present ? origin.value : this.origin,
    episode: episode.present ? episode.value : this.episode,
    image: image ?? this.image,
    textImage: textImage.present ? textImage.value : this.textImage,
  );
  FavoritePersonModelData copyWithCompanion(FavoritePersonModelCompanion data) {
    return FavoritePersonModelData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      species: data.species.present ? data.species.value : this.species,
      gender: data.gender.present ? data.gender.value : this.gender,
      location: data.location.present ? data.location.value : this.location,
      origin: data.origin.present ? data.origin.value : this.origin,
      episode: data.episode.present ? data.episode.value : this.episode,
      image: data.image.present ? data.image.value : this.image,
      textImage: data.textImage.present ? data.textImage.value : this.textImage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePersonModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('gender: $gender, ')
          ..write('location: $location, ')
          ..write('origin: $origin, ')
          ..write('episode: $episode, ')
          ..write('image: $image, ')
          ..write('textImage: $textImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    status,
    species,
    gender,
    location,
    origin,
    episode,
    $driftBlobEquality.hash(image),
    textImage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoritePersonModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.species == this.species &&
          other.gender == this.gender &&
          other.location == this.location &&
          other.origin == this.origin &&
          other.episode == this.episode &&
          $driftBlobEquality.equals(other.image, this.image) &&
          other.textImage == this.textImage);
}

class FavoritePersonModelCompanion
    extends UpdateCompanion<FavoritePersonModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> status;
  final Value<String?> species;
  final Value<String?> gender;
  final Value<String?> location;
  final Value<String?> origin;
  final Value<String?> episode;
  final Value<Uint8List> image;
  final Value<String?> textImage;
  final Value<int> rowid;
  const FavoritePersonModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.gender = const Value.absent(),
    this.location = const Value.absent(),
    this.origin = const Value.absent(),
    this.episode = const Value.absent(),
    this.image = const Value.absent(),
    this.textImage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritePersonModelCompanion.insert({
    required int id,
    required String name,
    this.status = const Value.absent(),
    this.species = const Value.absent(),
    this.gender = const Value.absent(),
    this.location = const Value.absent(),
    this.origin = const Value.absent(),
    this.episode = const Value.absent(),
    required Uint8List image,
    this.textImage = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       image = Value(image);
  static Insertable<FavoritePersonModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? status,
    Expression<String>? species,
    Expression<String>? gender,
    Expression<String>? location,
    Expression<String>? origin,
    Expression<String>? episode,
    Expression<Uint8List>? image,
    Expression<String>? textImage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (gender != null) 'gender': gender,
      if (location != null) 'location': location,
      if (origin != null) 'origin': origin,
      if (episode != null) 'episode': episode,
      if (image != null) 'image': image,
      if (textImage != null) 'text_image': textImage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritePersonModelCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? status,
    Value<String?>? species,
    Value<String?>? gender,
    Value<String?>? location,
    Value<String?>? origin,
    Value<String?>? episode,
    Value<Uint8List>? image,
    Value<String?>? textImage,
    Value<int>? rowid,
  }) {
    return FavoritePersonModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      origin: origin ?? this.origin,
      episode: episode ?? this.episode,
      image: image ?? this.image,
      textImage: textImage ?? this.textImage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (episode.present) {
      map['episode'] = Variable<String>(episode.value);
    }
    if (image.present) {
      map['image'] = Variable<Uint8List>(image.value);
    }
    if (textImage.present) {
      map['text_image'] = Variable<String>(textImage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritePersonModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('species: $species, ')
          ..write('gender: $gender, ')
          ..write('location: $location, ')
          ..write('origin: $origin, ')
          ..write('episode: $episode, ')
          ..write('image: $image, ')
          ..write('textImage: $textImage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoritePersonModelTable favoritePersonModel =
      $FavoritePersonModelTable(this);
  late final FavoritePersonLocalDataSource favoritePersonLocalDataSource =
      FavoritePersonLocalDataSource(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoritePersonModel];
}

typedef $$FavoritePersonModelTableCreateCompanionBuilder =
    FavoritePersonModelCompanion Function({
      required int id,
      required String name,
      Value<String?> status,
      Value<String?> species,
      Value<String?> gender,
      Value<String?> location,
      Value<String?> origin,
      Value<String?> episode,
      required Uint8List image,
      Value<String?> textImage,
      Value<int> rowid,
    });
typedef $$FavoritePersonModelTableUpdateCompanionBuilder =
    FavoritePersonModelCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> status,
      Value<String?> species,
      Value<String?> gender,
      Value<String?> location,
      Value<String?> origin,
      Value<String?> episode,
      Value<Uint8List> image,
      Value<String?> textImage,
      Value<int> rowid,
    });

class $$FavoritePersonModelTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritePersonModelTable> {
  $$FavoritePersonModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textImage => $composableBuilder(
    column: $table.textImage,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritePersonModelTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritePersonModelTable> {
  $$FavoritePersonModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get episode => $composableBuilder(
    column: $table.episode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textImage => $composableBuilder(
    column: $table.textImage,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritePersonModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritePersonModelTable> {
  $$FavoritePersonModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get episode =>
      $composableBuilder(column: $table.episode, builder: (column) => column);

  GeneratedColumn<Uint8List> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get textImage =>
      $composableBuilder(column: $table.textImage, builder: (column) => column);
}

class $$FavoritePersonModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritePersonModelTable,
          FavoritePersonModelData,
          $$FavoritePersonModelTableFilterComposer,
          $$FavoritePersonModelTableOrderingComposer,
          $$FavoritePersonModelTableAnnotationComposer,
          $$FavoritePersonModelTableCreateCompanionBuilder,
          $$FavoritePersonModelTableUpdateCompanionBuilder,
          (
            FavoritePersonModelData,
            BaseReferences<
              _$AppDatabase,
              $FavoritePersonModelTable,
              FavoritePersonModelData
            >,
          ),
          FavoritePersonModelData,
          PrefetchHooks Function()
        > {
  $$FavoritePersonModelTableTableManager(
    _$AppDatabase db,
    $FavoritePersonModelTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FavoritePersonModelTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$FavoritePersonModelTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FavoritePersonModelTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> species = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> episode = const Value.absent(),
                Value<Uint8List> image = const Value.absent(),
                Value<String?> textImage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritePersonModelCompanion(
                id: id,
                name: name,
                status: status,
                species: species,
                gender: gender,
                location: location,
                origin: origin,
                episode: episode,
                image: image,
                textImage: textImage,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int id,
                required String name,
                Value<String?> status = const Value.absent(),
                Value<String?> species = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> episode = const Value.absent(),
                required Uint8List image,
                Value<String?> textImage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoritePersonModelCompanion.insert(
                id: id,
                name: name,
                status: status,
                species: species,
                gender: gender,
                location: location,
                origin: origin,
                episode: episode,
                image: image,
                textImage: textImage,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritePersonModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritePersonModelTable,
      FavoritePersonModelData,
      $$FavoritePersonModelTableFilterComposer,
      $$FavoritePersonModelTableOrderingComposer,
      $$FavoritePersonModelTableAnnotationComposer,
      $$FavoritePersonModelTableCreateCompanionBuilder,
      $$FavoritePersonModelTableUpdateCompanionBuilder,
      (
        FavoritePersonModelData,
        BaseReferences<
          _$AppDatabase,
          $FavoritePersonModelTable,
          FavoritePersonModelData
        >,
      ),
      FavoritePersonModelData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoritePersonModelTableTableManager get favoritePersonModel =>
      $$FavoritePersonModelTableTableManager(_db, _db.favoritePersonModel);
}
