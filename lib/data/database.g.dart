// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ArtworksTable extends Artworks with TableInfo<$ArtworksTable, Artwork> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtworksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailPathMeta = const VerificationMeta(
    'thumbnailPath',
  );
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _softwareUsedMeta = const VerificationMeta(
    'softwareUsed',
  );
  @override
  late final GeneratedColumn<String> softwareUsed = GeneratedColumn<String>(
    'software_used',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _canvasWidthMeta = const VerificationMeta(
    'canvasWidth',
  );
  @override
  late final GeneratedColumn<int> canvasWidth = GeneratedColumn<int>(
    'canvas_width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _canvasHeightMeta = const VerificationMeta(
    'canvasHeight',
  );
  @override
  late final GeneratedColumn<int> canvasHeight = GeneratedColumn<int>(
    'canvas_height',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timeSpentMinutesMeta = const VerificationMeta(
    'timeSpentMinutes',
  );
  @override
  late final GeneratedColumn<int> timeSpentMinutes = GeneratedColumn<int>(
    'time_spent_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conceptMeta = const VerificationMeta(
    'concept',
  );
  @override
  late final GeneratedColumn<String> concept = GeneratedColumn<String>(
    'concept',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    imagePath,
    thumbnailPath,
    softwareUsed,
    canvasWidth,
    canvasHeight,
    timeSpentMinutes,
    concept,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artworks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Artwork> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnailPathMeta,
        thumbnailPath.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnailPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_thumbnailPathMeta);
    }
    if (data.containsKey('software_used')) {
      context.handle(
        _softwareUsedMeta,
        softwareUsed.isAcceptableOrUnknown(
          data['software_used']!,
          _softwareUsedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_softwareUsedMeta);
    }
    if (data.containsKey('canvas_width')) {
      context.handle(
        _canvasWidthMeta,
        canvasWidth.isAcceptableOrUnknown(
          data['canvas_width']!,
          _canvasWidthMeta,
        ),
      );
    }
    if (data.containsKey('canvas_height')) {
      context.handle(
        _canvasHeightMeta,
        canvasHeight.isAcceptableOrUnknown(
          data['canvas_height']!,
          _canvasHeightMeta,
        ),
      );
    }
    if (data.containsKey('time_spent_minutes')) {
      context.handle(
        _timeSpentMinutesMeta,
        timeSpentMinutes.isAcceptableOrUnknown(
          data['time_spent_minutes']!,
          _timeSpentMinutesMeta,
        ),
      );
    }
    if (data.containsKey('concept')) {
      context.handle(
        _conceptMeta,
        concept.isAcceptableOrUnknown(data['concept']!, _conceptMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Artwork map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Artwork(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      thumbnailPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_path'],
      )!,
      softwareUsed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}software_used'],
      )!,
      canvasWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}canvas_width'],
      ),
      canvasHeight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}canvas_height'],
      ),
      timeSpentMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time_spent_minutes'],
      ),
      concept: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}concept'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ArtworksTable createAlias(String alias) {
    return $ArtworksTable(attachedDatabase, alias);
  }
}

class Artwork extends DataClass implements Insertable<Artwork> {
  final int id;
  final String title;
  final String imagePath;
  final String thumbnailPath;
  final String softwareUsed;
  final int? canvasWidth;
  final int? canvasHeight;
  final int? timeSpentMinutes;
  final String? concept;
  final DateTime createdAt;
  const Artwork({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.thumbnailPath,
    required this.softwareUsed,
    this.canvasWidth,
    this.canvasHeight,
    this.timeSpentMinutes,
    this.concept,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['image_path'] = Variable<String>(imagePath);
    map['thumbnail_path'] = Variable<String>(thumbnailPath);
    map['software_used'] = Variable<String>(softwareUsed);
    if (!nullToAbsent || canvasWidth != null) {
      map['canvas_width'] = Variable<int>(canvasWidth);
    }
    if (!nullToAbsent || canvasHeight != null) {
      map['canvas_height'] = Variable<int>(canvasHeight);
    }
    if (!nullToAbsent || timeSpentMinutes != null) {
      map['time_spent_minutes'] = Variable<int>(timeSpentMinutes);
    }
    if (!nullToAbsent || concept != null) {
      map['concept'] = Variable<String>(concept);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ArtworksCompanion toCompanion(bool nullToAbsent) {
    return ArtworksCompanion(
      id: Value(id),
      title: Value(title),
      imagePath: Value(imagePath),
      thumbnailPath: Value(thumbnailPath),
      softwareUsed: Value(softwareUsed),
      canvasWidth: canvasWidth == null && nullToAbsent
          ? const Value.absent()
          : Value(canvasWidth),
      canvasHeight: canvasHeight == null && nullToAbsent
          ? const Value.absent()
          : Value(canvasHeight),
      timeSpentMinutes: timeSpentMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(timeSpentMinutes),
      concept: concept == null && nullToAbsent
          ? const Value.absent()
          : Value(concept),
      createdAt: Value(createdAt),
    );
  }

  factory Artwork.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Artwork(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      thumbnailPath: serializer.fromJson<String>(json['thumbnailPath']),
      softwareUsed: serializer.fromJson<String>(json['softwareUsed']),
      canvasWidth: serializer.fromJson<int?>(json['canvasWidth']),
      canvasHeight: serializer.fromJson<int?>(json['canvasHeight']),
      timeSpentMinutes: serializer.fromJson<int?>(json['timeSpentMinutes']),
      concept: serializer.fromJson<String?>(json['concept']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'imagePath': serializer.toJson<String>(imagePath),
      'thumbnailPath': serializer.toJson<String>(thumbnailPath),
      'softwareUsed': serializer.toJson<String>(softwareUsed),
      'canvasWidth': serializer.toJson<int?>(canvasWidth),
      'canvasHeight': serializer.toJson<int?>(canvasHeight),
      'timeSpentMinutes': serializer.toJson<int?>(timeSpentMinutes),
      'concept': serializer.toJson<String?>(concept),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Artwork copyWith({
    int? id,
    String? title,
    String? imagePath,
    String? thumbnailPath,
    String? softwareUsed,
    Value<int?> canvasWidth = const Value.absent(),
    Value<int?> canvasHeight = const Value.absent(),
    Value<int?> timeSpentMinutes = const Value.absent(),
    Value<String?> concept = const Value.absent(),
    DateTime? createdAt,
  }) => Artwork(
    id: id ?? this.id,
    title: title ?? this.title,
    imagePath: imagePath ?? this.imagePath,
    thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    softwareUsed: softwareUsed ?? this.softwareUsed,
    canvasWidth: canvasWidth.present ? canvasWidth.value : this.canvasWidth,
    canvasHeight: canvasHeight.present ? canvasHeight.value : this.canvasHeight,
    timeSpentMinutes: timeSpentMinutes.present
        ? timeSpentMinutes.value
        : this.timeSpentMinutes,
    concept: concept.present ? concept.value : this.concept,
    createdAt: createdAt ?? this.createdAt,
  );
  Artwork copyWithCompanion(ArtworksCompanion data) {
    return Artwork(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      softwareUsed: data.softwareUsed.present
          ? data.softwareUsed.value
          : this.softwareUsed,
      canvasWidth: data.canvasWidth.present
          ? data.canvasWidth.value
          : this.canvasWidth,
      canvasHeight: data.canvasHeight.present
          ? data.canvasHeight.value
          : this.canvasHeight,
      timeSpentMinutes: data.timeSpentMinutes.present
          ? data.timeSpentMinutes.value
          : this.timeSpentMinutes,
      concept: data.concept.present ? data.concept.value : this.concept,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Artwork(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imagePath: $imagePath, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('softwareUsed: $softwareUsed, ')
          ..write('canvasWidth: $canvasWidth, ')
          ..write('canvasHeight: $canvasHeight, ')
          ..write('timeSpentMinutes: $timeSpentMinutes, ')
          ..write('concept: $concept, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    imagePath,
    thumbnailPath,
    softwareUsed,
    canvasWidth,
    canvasHeight,
    timeSpentMinutes,
    concept,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Artwork &&
          other.id == this.id &&
          other.title == this.title &&
          other.imagePath == this.imagePath &&
          other.thumbnailPath == this.thumbnailPath &&
          other.softwareUsed == this.softwareUsed &&
          other.canvasWidth == this.canvasWidth &&
          other.canvasHeight == this.canvasHeight &&
          other.timeSpentMinutes == this.timeSpentMinutes &&
          other.concept == this.concept &&
          other.createdAt == this.createdAt);
}

class ArtworksCompanion extends UpdateCompanion<Artwork> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> imagePath;
  final Value<String> thumbnailPath;
  final Value<String> softwareUsed;
  final Value<int?> canvasWidth;
  final Value<int?> canvasHeight;
  final Value<int?> timeSpentMinutes;
  final Value<String?> concept;
  final Value<DateTime> createdAt;
  const ArtworksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.softwareUsed = const Value.absent(),
    this.canvasWidth = const Value.absent(),
    this.canvasHeight = const Value.absent(),
    this.timeSpentMinutes = const Value.absent(),
    this.concept = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ArtworksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String imagePath,
    required String thumbnailPath,
    required String softwareUsed,
    this.canvasWidth = const Value.absent(),
    this.canvasHeight = const Value.absent(),
    this.timeSpentMinutes = const Value.absent(),
    this.concept = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       imagePath = Value(imagePath),
       thumbnailPath = Value(thumbnailPath),
       softwareUsed = Value(softwareUsed);
  static Insertable<Artwork> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? imagePath,
    Expression<String>? thumbnailPath,
    Expression<String>? softwareUsed,
    Expression<int>? canvasWidth,
    Expression<int>? canvasHeight,
    Expression<int>? timeSpentMinutes,
    Expression<String>? concept,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (imagePath != null) 'image_path': imagePath,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (softwareUsed != null) 'software_used': softwareUsed,
      if (canvasWidth != null) 'canvas_width': canvasWidth,
      if (canvasHeight != null) 'canvas_height': canvasHeight,
      if (timeSpentMinutes != null) 'time_spent_minutes': timeSpentMinutes,
      if (concept != null) 'concept': concept,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ArtworksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? imagePath,
    Value<String>? thumbnailPath,
    Value<String>? softwareUsed,
    Value<int?>? canvasWidth,
    Value<int?>? canvasHeight,
    Value<int?>? timeSpentMinutes,
    Value<String?>? concept,
    Value<DateTime>? createdAt,
  }) {
    return ArtworksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      softwareUsed: softwareUsed ?? this.softwareUsed,
      canvasWidth: canvasWidth ?? this.canvasWidth,
      canvasHeight: canvasHeight ?? this.canvasHeight,
      timeSpentMinutes: timeSpentMinutes ?? this.timeSpentMinutes,
      concept: concept ?? this.concept,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (softwareUsed.present) {
      map['software_used'] = Variable<String>(softwareUsed.value);
    }
    if (canvasWidth.present) {
      map['canvas_width'] = Variable<int>(canvasWidth.value);
    }
    if (canvasHeight.present) {
      map['canvas_height'] = Variable<int>(canvasHeight.value);
    }
    if (timeSpentMinutes.present) {
      map['time_spent_minutes'] = Variable<int>(timeSpentMinutes.value);
    }
    if (concept.present) {
      map['concept'] = Variable<String>(concept.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtworksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imagePath: $imagePath, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('softwareUsed: $softwareUsed, ')
          ..write('canvasWidth: $canvasWidth, ')
          ..write('canvasHeight: $canvasHeight, ')
          ..write('timeSpentMinutes: $timeSpentMinutes, ')
          ..write('concept: $concept, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArtworksTable artworks = $ArtworksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [artworks];
}

typedef $$ArtworksTableCreateCompanionBuilder = ArtworksCompanion Function({
  Value<int> id,
  required String title,
  required String imagePath,
  required String thumbnailPath,
  required String softwareUsed,
  Value<int?> canvasWidth,
  Value<int?> canvasHeight,
  Value<int?> timeSpentMinutes,
  Value<String?> concept,
  Value<DateTime> createdAt,
});
typedef $$ArtworksTableUpdateCompanionBuilder = ArtworksCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> imagePath,
  Value<String> thumbnailPath,
  Value<String> softwareUsed,
  Value<int?> canvasWidth,
  Value<int?> canvasHeight,
  Value<int?> timeSpentMinutes,
  Value<String?> concept,
  Value<DateTime> createdAt,
});

class $$ArtworksTableFilterComposer
    extends Composer<_$AppDatabase, $ArtworksTable> {
  $$ArtworksTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get softwareUsed => $composableBuilder(
    column: $table.softwareUsed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get canvasWidth => $composableBuilder(
    column: $table.canvasWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get canvasHeight => $composableBuilder(
    column: $table.canvasHeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timeSpentMinutes => $composableBuilder(
    column: $table.timeSpentMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get concept => $composableBuilder(
    column: $table.concept,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ArtworksTableOrderingComposer
    extends Composer<_$AppDatabase, $ArtworksTable> {
  $$ArtworksTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get softwareUsed => $composableBuilder(
    column: $table.softwareUsed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get canvasWidth => $composableBuilder(
    column: $table.canvasWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get canvasHeight => $composableBuilder(
    column: $table.canvasHeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timeSpentMinutes => $composableBuilder(
    column: $table.timeSpentMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get concept => $composableBuilder(
    column: $table.concept,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ArtworksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArtworksTable> {
  $$ArtworksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get softwareUsed => $composableBuilder(
    column: $table.softwareUsed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get canvasWidth => $composableBuilder(
    column: $table.canvasWidth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get canvasHeight => $composableBuilder(
    column: $table.canvasHeight,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timeSpentMinutes => $composableBuilder(
    column: $table.timeSpentMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get concept =>
      $composableBuilder(column: $table.concept, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ArtworksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArtworksTable,
          Artwork,
          $$ArtworksTableFilterComposer,
          $$ArtworksTableOrderingComposer,
          $$ArtworksTableAnnotationComposer,
          $$ArtworksTableCreateCompanionBuilder,
          $$ArtworksTableUpdateCompanionBuilder,
          (Artwork, BaseReferences<_$AppDatabase, $ArtworksTable, Artwork>),
          Artwork,
          PrefetchHooks Function()
        > {
  $$ArtworksTableTableManager(_$AppDatabase db, $ArtworksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArtworksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArtworksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArtworksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String> thumbnailPath = const Value.absent(),
                Value<String> softwareUsed = const Value.absent(),
                Value<int?> canvasWidth = const Value.absent(),
                Value<int?> canvasHeight = const Value.absent(),
                Value<int?> timeSpentMinutes = const Value.absent(),
                Value<String?> concept = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ArtworksCompanion(
                id: id,
                title: title,
                imagePath: imagePath,
                thumbnailPath: thumbnailPath,
                softwareUsed: softwareUsed,
                canvasWidth: canvasWidth,
                canvasHeight: canvasHeight,
                timeSpentMinutes: timeSpentMinutes,
                concept: concept,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String imagePath,
                required String thumbnailPath,
                required String softwareUsed,
                Value<int?> canvasWidth = const Value.absent(),
                Value<int?> canvasHeight = const Value.absent(),
                Value<int?> timeSpentMinutes = const Value.absent(),
                Value<String?> concept = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ArtworksCompanion.insert(
                id: id,
                title: title,
                imagePath: imagePath,
                thumbnailPath: thumbnailPath,
                softwareUsed: softwareUsed,
                canvasWidth: canvasWidth,
                canvasHeight: canvasHeight,
                timeSpentMinutes: timeSpentMinutes,
                concept: concept,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ArtworksTable, Artwork>(table),
                  BaseReferences<_$AppDatabase, $ArtworksTable, Artwork>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ArtworksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArtworksTable,
      Artwork,
      $$ArtworksTableFilterComposer,
      $$ArtworksTableOrderingComposer,
      $$ArtworksTableAnnotationComposer,
      $$ArtworksTableCreateCompanionBuilder,
      $$ArtworksTableUpdateCompanionBuilder,
      (Artwork, BaseReferences<_$AppDatabase, $ArtworksTable, Artwork>),
      Artwork,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArtworksTableTableManager get artworks =>
      $$ArtworksTableTableManager(_db, _db.artworks);
}
