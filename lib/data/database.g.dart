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

class $BrushesTable extends Brushes with TableInfo<$BrushesTable, Brush> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrushesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'brushes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Brush> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Brush map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Brush(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $BrushesTable createAlias(String alias) {
    return $BrushesTable(attachedDatabase, alias);
  }
}

class Brush extends DataClass implements Insertable<Brush> {
  final int id;
  final String name;
  const Brush({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  BrushesCompanion toCompanion(bool nullToAbsent) {
    return BrushesCompanion(id: Value(id), name: Value(name));
  }

  factory Brush.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Brush(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Brush copyWith({int? id, String? name}) =>
      Brush(id: id ?? this.id, name: name ?? this.name);
  Brush copyWithCompanion(BrushesCompanion data) {
    return Brush(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Brush(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Brush && other.id == this.id && other.name == this.name);
}

class BrushesCompanion extends UpdateCompanion<Brush> {
  final Value<int> id;
  final Value<String> name;
  const BrushesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  BrushesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Brush> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  BrushesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return BrushesCompanion(id: id ?? this.id, name: name ?? this.name);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrushesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ArtworkBrushesTable extends ArtworkBrushes
    with TableInfo<$ArtworkBrushesTable, ArtworkBrushe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtworkBrushesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _artworkIdMeta = const VerificationMeta(
    'artworkId',
  );
  @override
  late final GeneratedColumn<int> artworkId = GeneratedColumn<int>(
    'artwork_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES artworks (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _brushIdMeta = const VerificationMeta(
    'brushId',
  );
  @override
  late final GeneratedColumn<int> brushId = GeneratedColumn<int>(
    'brush_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES brushes (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [artworkId, brushId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artwork_brushes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArtworkBrushe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('artwork_id')) {
      context.handle(
        _artworkIdMeta,
        artworkId.isAcceptableOrUnknown(data['artwork_id']!, _artworkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_artworkIdMeta);
    }
    if (data.containsKey('brush_id')) {
      context.handle(
        _brushIdMeta,
        brushId.isAcceptableOrUnknown(data['brush_id']!, _brushIdMeta),
      );
    } else if (isInserting) {
      context.missing(_brushIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {artworkId, brushId};
  @override
  ArtworkBrushe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtworkBrushe(
      artworkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}artwork_id'],
      )!,
      brushId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}brush_id'],
      )!,
    );
  }

  @override
  $ArtworkBrushesTable createAlias(String alias) {
    return $ArtworkBrushesTable(attachedDatabase, alias);
  }
}

class ArtworkBrushe extends DataClass implements Insertable<ArtworkBrushe> {
  final int artworkId;
  final int brushId;
  const ArtworkBrushe({required this.artworkId, required this.brushId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['artwork_id'] = Variable<int>(artworkId);
    map['brush_id'] = Variable<int>(brushId);
    return map;
  }

  ArtworkBrushesCompanion toCompanion(bool nullToAbsent) {
    return ArtworkBrushesCompanion(
      artworkId: Value(artworkId),
      brushId: Value(brushId),
    );
  }

  factory ArtworkBrushe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtworkBrushe(
      artworkId: serializer.fromJson<int>(json['artworkId']),
      brushId: serializer.fromJson<int>(json['brushId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'artworkId': serializer.toJson<int>(artworkId),
      'brushId': serializer.toJson<int>(brushId),
    };
  }

  ArtworkBrushe copyWith({int? artworkId, int? brushId}) => ArtworkBrushe(
    artworkId: artworkId ?? this.artworkId,
    brushId: brushId ?? this.brushId,
  );
  ArtworkBrushe copyWithCompanion(ArtworkBrushesCompanion data) {
    return ArtworkBrushe(
      artworkId: data.artworkId.present ? data.artworkId.value : this.artworkId,
      brushId: data.brushId.present ? data.brushId.value : this.brushId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArtworkBrushe(')
          ..write('artworkId: $artworkId, ')
          ..write('brushId: $brushId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(artworkId, brushId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtworkBrushe &&
          other.artworkId == this.artworkId &&
          other.brushId == this.brushId);
}

class ArtworkBrushesCompanion extends UpdateCompanion<ArtworkBrushe> {
  final Value<int> artworkId;
  final Value<int> brushId;
  final Value<int> rowid;
  const ArtworkBrushesCompanion({
    this.artworkId = const Value.absent(),
    this.brushId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArtworkBrushesCompanion.insert({
    required int artworkId,
    required int brushId,
    this.rowid = const Value.absent(),
  }) : artworkId = Value(artworkId),
       brushId = Value(brushId);
  static Insertable<ArtworkBrushe> custom({
    Expression<int>? artworkId,
    Expression<int>? brushId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (artworkId != null) 'artwork_id': artworkId,
      if (brushId != null) 'brush_id': brushId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArtworkBrushesCompanion copyWith({
    Value<int>? artworkId,
    Value<int>? brushId,
    Value<int>? rowid,
  }) {
    return ArtworkBrushesCompanion(
      artworkId: artworkId ?? this.artworkId,
      brushId: brushId ?? this.brushId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (artworkId.present) {
      map['artwork_id'] = Variable<int>(artworkId.value);
    }
    if (brushId.present) {
      map['brush_id'] = Variable<int>(brushId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtworkBrushesCompanion(')
          ..write('artworkId: $artworkId, ')
          ..write('brushId: $brushId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReferencesTable extends References
    with TableInfo<$ReferencesTable, Reference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferencesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _artworkIdMeta = const VerificationMeta(
    'artworkId',
  );
  @override
  late final GeneratedColumn<int> artworkId = GeneratedColumn<int>(
    'artwork_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES artworks (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlOrPathMeta = const VerificationMeta(
    'urlOrPath',
  );
  @override
  late final GeneratedColumn<String> urlOrPath = GeneratedColumn<String>(
    'url_or_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, artworkId, label, urlOrPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'references';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('artwork_id')) {
      context.handle(
        _artworkIdMeta,
        artworkId.isAcceptableOrUnknown(data['artwork_id']!, _artworkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_artworkIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('url_or_path')) {
      context.handle(
        _urlOrPathMeta,
        urlOrPath.isAcceptableOrUnknown(data['url_or_path']!, _urlOrPathMeta),
      );
    } else if (isInserting) {
      context.missing(_urlOrPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      artworkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}artwork_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      urlOrPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_or_path'],
      )!,
    );
  }

  @override
  $ReferencesTable createAlias(String alias) {
    return $ReferencesTable(attachedDatabase, alias);
  }
}

class Reference extends DataClass implements Insertable<Reference> {
  final int id;
  final int artworkId;
  final String label;
  final String urlOrPath;
  const Reference({
    required this.id,
    required this.artworkId,
    required this.label,
    required this.urlOrPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['artwork_id'] = Variable<int>(artworkId);
    map['label'] = Variable<String>(label);
    map['url_or_path'] = Variable<String>(urlOrPath);
    return map;
  }

  ReferencesCompanion toCompanion(bool nullToAbsent) {
    return ReferencesCompanion(
      id: Value(id),
      artworkId: Value(artworkId),
      label: Value(label),
      urlOrPath: Value(urlOrPath),
    );
  }

  factory Reference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reference(
      id: serializer.fromJson<int>(json['id']),
      artworkId: serializer.fromJson<int>(json['artworkId']),
      label: serializer.fromJson<String>(json['label']),
      urlOrPath: serializer.fromJson<String>(json['urlOrPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'artworkId': serializer.toJson<int>(artworkId),
      'label': serializer.toJson<String>(label),
      'urlOrPath': serializer.toJson<String>(urlOrPath),
    };
  }

  Reference copyWith({
    int? id,
    int? artworkId,
    String? label,
    String? urlOrPath,
  }) => Reference(
    id: id ?? this.id,
    artworkId: artworkId ?? this.artworkId,
    label: label ?? this.label,
    urlOrPath: urlOrPath ?? this.urlOrPath,
  );
  Reference copyWithCompanion(ReferencesCompanion data) {
    return Reference(
      id: data.id.present ? data.id.value : this.id,
      artworkId: data.artworkId.present ? data.artworkId.value : this.artworkId,
      label: data.label.present ? data.label.value : this.label,
      urlOrPath: data.urlOrPath.present ? data.urlOrPath.value : this.urlOrPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reference(')
          ..write('id: $id, ')
          ..write('artworkId: $artworkId, ')
          ..write('label: $label, ')
          ..write('urlOrPath: $urlOrPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, artworkId, label, urlOrPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reference &&
          other.id == this.id &&
          other.artworkId == this.artworkId &&
          other.label == this.label &&
          other.urlOrPath == this.urlOrPath);
}

class ReferencesCompanion extends UpdateCompanion<Reference> {
  final Value<int> id;
  final Value<int> artworkId;
  final Value<String> label;
  final Value<String> urlOrPath;
  const ReferencesCompanion({
    this.id = const Value.absent(),
    this.artworkId = const Value.absent(),
    this.label = const Value.absent(),
    this.urlOrPath = const Value.absent(),
  });
  ReferencesCompanion.insert({
    this.id = const Value.absent(),
    required int artworkId,
    required String label,
    required String urlOrPath,
  }) : artworkId = Value(artworkId),
       label = Value(label),
       urlOrPath = Value(urlOrPath);
  static Insertable<Reference> custom({
    Expression<int>? id,
    Expression<int>? artworkId,
    Expression<String>? label,
    Expression<String>? urlOrPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (artworkId != null) 'artwork_id': artworkId,
      if (label != null) 'label': label,
      if (urlOrPath != null) 'url_or_path': urlOrPath,
    });
  }

  ReferencesCompanion copyWith({
    Value<int>? id,
    Value<int>? artworkId,
    Value<String>? label,
    Value<String>? urlOrPath,
  }) {
    return ReferencesCompanion(
      id: id ?? this.id,
      artworkId: artworkId ?? this.artworkId,
      label: label ?? this.label,
      urlOrPath: urlOrPath ?? this.urlOrPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (artworkId.present) {
      map['artwork_id'] = Variable<int>(artworkId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (urlOrPath.present) {
      map['url_or_path'] = Variable<String>(urlOrPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferencesCompanion(')
          ..write('id: $id, ')
          ..write('artworkId: $artworkId, ')
          ..write('label: $label, ')
          ..write('urlOrPath: $urlOrPath')
          ..write(')'))
        .toString();
  }
}

class $FeedbacksTable extends Feedbacks
    with TableInfo<$FeedbacksTable, Feedback> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedbacksTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _artworkIdMeta = const VerificationMeta(
    'artworkId',
  );
  @override
  late final GeneratedColumn<int> artworkId = GeneratedColumn<int>(
    'artwork_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES artworks (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, artworkId, type, note, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feedbacks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Feedback> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('artwork_id')) {
      context.handle(
        _artworkIdMeta,
        artworkId.isAcceptableOrUnknown(data['artwork_id']!, _artworkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_artworkIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    } else if (isInserting) {
      context.missing(_noteMeta);
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
  Feedback map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feedback(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      artworkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}artwork_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FeedbacksTable createAlias(String alias) {
    return $FeedbacksTable(attachedDatabase, alias);
  }
}

class Feedback extends DataClass implements Insertable<Feedback> {
  final int id;
  final int artworkId;
  final String type;
  final String note;
  final DateTime createdAt;
  const Feedback({
    required this.id,
    required this.artworkId,
    required this.type,
    required this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['artwork_id'] = Variable<int>(artworkId);
    map['type'] = Variable<String>(type);
    map['note'] = Variable<String>(note);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FeedbacksCompanion toCompanion(bool nullToAbsent) {
    return FeedbacksCompanion(
      id: Value(id),
      artworkId: Value(artworkId),
      type: Value(type),
      note: Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory Feedback.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feedback(
      id: serializer.fromJson<int>(json['id']),
      artworkId: serializer.fromJson<int>(json['artworkId']),
      type: serializer.fromJson<String>(json['type']),
      note: serializer.fromJson<String>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'artworkId': serializer.toJson<int>(artworkId),
      'type': serializer.toJson<String>(type),
      'note': serializer.toJson<String>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Feedback copyWith({
    int? id,
    int? artworkId,
    String? type,
    String? note,
    DateTime? createdAt,
  }) => Feedback(
    id: id ?? this.id,
    artworkId: artworkId ?? this.artworkId,
    type: type ?? this.type,
    note: note ?? this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  Feedback copyWithCompanion(FeedbacksCompanion data) {
    return Feedback(
      id: data.id.present ? data.id.value : this.id,
      artworkId: data.artworkId.present ? data.artworkId.value : this.artworkId,
      type: data.type.present ? data.type.value : this.type,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Feedback(')
          ..write('id: $id, ')
          ..write('artworkId: $artworkId, ')
          ..write('type: $type, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, artworkId, type, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feedback &&
          other.id == this.id &&
          other.artworkId == this.artworkId &&
          other.type == this.type &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class FeedbacksCompanion extends UpdateCompanion<Feedback> {
  final Value<int> id;
  final Value<int> artworkId;
  final Value<String> type;
  final Value<String> note;
  final Value<DateTime> createdAt;
  const FeedbacksCompanion({
    this.id = const Value.absent(),
    this.artworkId = const Value.absent(),
    this.type = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FeedbacksCompanion.insert({
    this.id = const Value.absent(),
    required int artworkId,
    required String type,
    required String note,
    this.createdAt = const Value.absent(),
  }) : artworkId = Value(artworkId),
       type = Value(type),
       note = Value(note);
  static Insertable<Feedback> custom({
    Expression<int>? id,
    Expression<int>? artworkId,
    Expression<String>? type,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (artworkId != null) 'artwork_id': artworkId,
      if (type != null) 'type': type,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FeedbacksCompanion copyWith({
    Value<int>? id,
    Value<int>? artworkId,
    Value<String>? type,
    Value<String>? note,
    Value<DateTime>? createdAt,
  }) {
    return FeedbacksCompanion(
      id: id ?? this.id,
      artworkId: artworkId ?? this.artworkId,
      type: type ?? this.type,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (artworkId.present) {
      map['artwork_id'] = Variable<int>(artworkId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedbacksCompanion(')
          ..write('id: $id, ')
          ..write('artworkId: $artworkId, ')
          ..write('type: $type, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArtworksTable artworks = $ArtworksTable(this);
  late final $BrushesTable brushes = $BrushesTable(this);
  late final $ArtworkBrushesTable artworkBrushes = $ArtworkBrushesTable(this);
  late final $ReferencesTable references = $ReferencesTable(this);
  late final $FeedbacksTable feedbacks = $FeedbacksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    artworks,
    brushes,
    artworkBrushes,
    references,
    feedbacks,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'artworks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('artwork_brushes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'brushes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('artwork_brushes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'artworks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('references', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'artworks',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('feedbacks', kind: UpdateKind.delete)],
    ),
  ]);
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

final class $$ArtworksTableReferences
    extends BaseReferences<_$AppDatabase, $ArtworksTable, Artwork> {
  $$ArtworksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArtworkBrushesTable, List<ArtworkBrushe>>
  _artworkBrushesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.artworkBrushes,
    aliasName: 'artworks__id__artwork_brushes__artwork_id',
  );

  $$ArtworkBrushesTableProcessedTableManager get artworkBrushesRefs {
    final manager = $$ArtworkBrushesTableTableManager(
      $_db,
      $_db.artworkBrushes,
    ).filter((f) => f.artworkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_artworkBrushesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReferencesTable, List<Reference>>
  _referencesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.references,
    aliasName: 'artworks__id__references__artwork_id',
  );

  $$ReferencesTableProcessedTableManager get referencesRefs {
    final manager = $$ReferencesTableTableManager(
      $_db,
      $_db.references,
    ).filter((f) => f.artworkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_referencesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FeedbacksTable, List<Feedback>>
  _feedbacksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.feedbacks,
    aliasName: 'artworks__id__feedbacks__artwork_id',
  );

  $$FeedbacksTableProcessedTableManager get feedbacksRefs {
    final manager = $$FeedbacksTableTableManager(
      $_db,
      $_db.feedbacks,
    ).filter((f) => f.artworkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_feedbacksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> artworkBrushesRefs(
    Expression<bool> Function($$ArtworkBrushesTableFilterComposer f) f,
  ) {
    final $$ArtworkBrushesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artworkBrushes,
      getReferencedColumn: (t) => t.artworkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworkBrushesTableFilterComposer(
            $db: $db,
            $table: $db.artworkBrushes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> referencesRefs(
    Expression<bool> Function($$ReferencesTableFilterComposer f) f,
  ) {
    final $$ReferencesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.references,
      getReferencedColumn: (t) => t.artworkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferencesTableFilterComposer(
            $db: $db,
            $table: $db.references,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> feedbacksRefs(
    Expression<bool> Function($$FeedbacksTableFilterComposer f) f,
  ) {
    final $$FeedbacksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.feedbacks,
      getReferencedColumn: (t) => t.artworkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FeedbacksTableFilterComposer(
            $db: $db,
            $table: $db.feedbacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> artworkBrushesRefs<T extends Object>(
    Expression<T> Function($$ArtworkBrushesTableAnnotationComposer a) f,
  ) {
    final $$ArtworkBrushesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artworkBrushes,
      getReferencedColumn: (t) => t.artworkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworkBrushesTableAnnotationComposer(
            $db: $db,
            $table: $db.artworkBrushes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> referencesRefs<T extends Object>(
    Expression<T> Function($$ReferencesTableAnnotationComposer a) f,
  ) {
    final $$ReferencesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.references,
      getReferencedColumn: (t) => t.artworkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReferencesTableAnnotationComposer(
            $db: $db,
            $table: $db.references,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> feedbacksRefs<T extends Object>(
    Expression<T> Function($$FeedbacksTableAnnotationComposer a) f,
  ) {
    final $$FeedbacksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.feedbacks,
      getReferencedColumn: (t) => t.artworkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FeedbacksTableAnnotationComposer(
            $db: $db,
            $table: $db.feedbacks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (Artwork, $$ArtworksTableReferences),
          Artwork,
          PrefetchHooks Function({
            bool artworkBrushesRefs,
            bool referencesRefs,
            bool feedbacksRefs,
          })
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
                  $$ArtworksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                artworkBrushesRefs = false,
                referencesRefs = false,
                feedbacksRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (artworkBrushesRefs) db.artworkBrushes,
                    if (referencesRefs) db.references,
                    if (feedbacksRefs) db.feedbacks,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (artworkBrushesRefs)
                        await $_getPrefetchedDataByColumns<
                          Artwork,
                          $ArtworksTable,
                          ArtworkBrushe,
                          $ArtworkBrushesTable
                        >(
                          currentTable: table,
                          referencedTable: $$ArtworksTableReferences
                              ._artworkBrushesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ArtworksTableReferences(
                                db,
                                table,
                                p0,
                              ).artworkBrushesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'artwork_id',
                          typedResults: items,
                        ),
                      if (referencesRefs)
                        await $_getPrefetchedDataByColumns<
                          Artwork,
                          $ArtworksTable,
                          Reference,
                          $ReferencesTable
                        >(
                          currentTable: table,
                          referencedTable: $$ArtworksTableReferences
                              ._referencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ArtworksTableReferences(
                                db,
                                table,
                                p0,
                              ).referencesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'artwork_id',
                          typedResults: items,
                        ),
                      if (feedbacksRefs)
                        await $_getPrefetchedDataByColumns<
                          Artwork,
                          $ArtworksTable,
                          Feedback,
                          $FeedbacksTable
                        >(
                          currentTable: table,
                          referencedTable: $$ArtworksTableReferences
                              ._feedbacksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ArtworksTableReferences(
                                db,
                                table,
                                p0,
                              ).feedbacksRefs,
                          currentColumn: 'id',
                          referencedColumn: 'artwork_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
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
      (Artwork, $$ArtworksTableReferences),
      Artwork,
      PrefetchHooks Function({
        bool artworkBrushesRefs,
        bool referencesRefs,
        bool feedbacksRefs,
      })
    >;
typedef $$BrushesTableCreateCompanionBuilder = BrushesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$BrushesTableUpdateCompanionBuilder = BrushesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$BrushesTableReferences
    extends BaseReferences<_$AppDatabase, $BrushesTable, Brush> {
  $$BrushesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArtworkBrushesTable, List<ArtworkBrushe>>
  _artworkBrushesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.artworkBrushes,
    aliasName: 'brushes__id__artwork_brushes__brush_id',
  );

  $$ArtworkBrushesTableProcessedTableManager get artworkBrushesRefs {
    final manager = $$ArtworkBrushesTableTableManager(
      $_db,
      $_db.artworkBrushes,
    ).filter((f) => f.brushId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_artworkBrushesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BrushesTableFilterComposer
    extends Composer<_$AppDatabase, $BrushesTable> {
  $$BrushesTableFilterComposer({
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

  Expression<bool> artworkBrushesRefs(
    Expression<bool> Function($$ArtworkBrushesTableFilterComposer f) f,
  ) {
    final $$ArtworkBrushesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artworkBrushes,
      getReferencedColumn: (t) => t.brushId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworkBrushesTableFilterComposer(
            $db: $db,
            $table: $db.artworkBrushes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BrushesTableOrderingComposer
    extends Composer<_$AppDatabase, $BrushesTable> {
  $$BrushesTableOrderingComposer({
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
}

class $$BrushesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BrushesTable> {
  $$BrushesTableAnnotationComposer({
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

  Expression<T> artworkBrushesRefs<T extends Object>(
    Expression<T> Function($$ArtworkBrushesTableAnnotationComposer a) f,
  ) {
    final $$ArtworkBrushesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artworkBrushes,
      getReferencedColumn: (t) => t.brushId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworkBrushesTableAnnotationComposer(
            $db: $db,
            $table: $db.artworkBrushes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BrushesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BrushesTable,
          Brush,
          $$BrushesTableFilterComposer,
          $$BrushesTableOrderingComposer,
          $$BrushesTableAnnotationComposer,
          $$BrushesTableCreateCompanionBuilder,
          $$BrushesTableUpdateCompanionBuilder,
          (Brush, $$BrushesTableReferences),
          Brush,
          PrefetchHooks Function({bool artworkBrushesRefs})
        > {
  $$BrushesTableTableManager(_$AppDatabase db, $BrushesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrushesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrushesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrushesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) => BrushesCompanion(id: id, name: name),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) => BrushesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BrushesTable, Brush>(table),
                  $$BrushesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({artworkBrushesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (artworkBrushesRefs) db.artworkBrushes,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (artworkBrushesRefs)
                    await $_getPrefetchedDataByColumns<
                      Brush,
                      $BrushesTable,
                      ArtworkBrushe,
                      $ArtworkBrushesTable
                    >(
                      currentTable: table,
                      referencedTable: $$BrushesTableReferences
                          ._artworkBrushesRefsTable(db),
                      managerFromTypedResult: (p0) => $$BrushesTableReferences(
                        db,
                        table,
                        p0,
                      ).artworkBrushesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'brush_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BrushesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BrushesTable,
      Brush,
      $$BrushesTableFilterComposer,
      $$BrushesTableOrderingComposer,
      $$BrushesTableAnnotationComposer,
      $$BrushesTableCreateCompanionBuilder,
      $$BrushesTableUpdateCompanionBuilder,
      (Brush, $$BrushesTableReferences),
      Brush,
      PrefetchHooks Function({bool artworkBrushesRefs})
    >;
typedef $$ArtworkBrushesTableCreateCompanionBuilder =
    ArtworkBrushesCompanion Function({
      required int artworkId,
      required int brushId,
      Value<int> rowid,
    });
typedef $$ArtworkBrushesTableUpdateCompanionBuilder =
    ArtworkBrushesCompanion Function({
      Value<int> artworkId,
      Value<int> brushId,
      Value<int> rowid,
    });

final class $$ArtworkBrushesTableReferences
    extends BaseReferences<_$AppDatabase, $ArtworkBrushesTable, ArtworkBrushe> {
  $$ArtworkBrushesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ArtworksTable _artworkIdTable(_$AppDatabase db) =>
      db.artworks.createAlias('artwork_brushes__artwork_id__artworks__id');

  $$ArtworksTableProcessedTableManager get artworkId {
    final $_column = $_itemColumn<int>('artwork_id')!;

    final manager = $$ArtworksTableTableManager(
      $_db,
      $_db.artworks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_artworkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BrushesTable _brushIdTable(_$AppDatabase db) =>
      db.brushes.createAlias('artwork_brushes__brush_id__brushes__id');

  $$BrushesTableProcessedTableManager get brushId {
    final $_column = $_itemColumn<int>('brush_id')!;

    final manager = $$BrushesTableTableManager(
      $_db,
      $_db.brushes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_brushIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ArtworkBrushesTableFilterComposer
    extends Composer<_$AppDatabase, $ArtworkBrushesTable> {
  $$ArtworkBrushesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArtworksTableFilterComposer get artworkId {
    final $$ArtworksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableFilterComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BrushesTableFilterComposer get brushId {
    final $$BrushesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brushId,
      referencedTable: $db.brushes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrushesTableFilterComposer(
            $db: $db,
            $table: $db.brushes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkBrushesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArtworkBrushesTable> {
  $$ArtworkBrushesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArtworksTableOrderingComposer get artworkId {
    final $$ArtworksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableOrderingComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BrushesTableOrderingComposer get brushId {
    final $$BrushesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brushId,
      referencedTable: $db.brushes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrushesTableOrderingComposer(
            $db: $db,
            $table: $db.brushes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkBrushesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArtworkBrushesTable> {
  $$ArtworkBrushesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ArtworksTableAnnotationComposer get artworkId {
    final $$ArtworksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableAnnotationComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BrushesTableAnnotationComposer get brushId {
    final $$BrushesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.brushId,
      referencedTable: $db.brushes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BrushesTableAnnotationComposer(
            $db: $db,
            $table: $db.brushes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkBrushesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArtworkBrushesTable,
          ArtworkBrushe,
          $$ArtworkBrushesTableFilterComposer,
          $$ArtworkBrushesTableOrderingComposer,
          $$ArtworkBrushesTableAnnotationComposer,
          $$ArtworkBrushesTableCreateCompanionBuilder,
          $$ArtworkBrushesTableUpdateCompanionBuilder,
          (ArtworkBrushe, $$ArtworkBrushesTableReferences),
          ArtworkBrushe,
          PrefetchHooks Function({bool artworkId, bool brushId})
        > {
  $$ArtworkBrushesTableTableManager(
    _$AppDatabase db,
    $ArtworkBrushesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArtworkBrushesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArtworkBrushesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArtworkBrushesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> artworkId = const Value.absent(),
                Value<int> brushId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArtworkBrushesCompanion(
                artworkId: artworkId,
                brushId: brushId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int artworkId,
                required int brushId,
                Value<int> rowid = const Value.absent(),
              }) => ArtworkBrushesCompanion.insert(
                artworkId: artworkId,
                brushId: brushId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ArtworkBrushesTable, ArtworkBrushe>(table),
                  $$ArtworkBrushesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({artworkId = false, brushId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (artworkId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.artworkId,
                        referencedTable: $$ArtworkBrushesTableReferences
                            ._artworkIdTable(db),
                        referencedColumn: $$ArtworkBrushesTableReferences
                            ._artworkIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (brushId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.brushId,
                        referencedTable: $$ArtworkBrushesTableReferences
                            ._brushIdTable(db),
                        referencedColumn: $$ArtworkBrushesTableReferences
                            ._brushIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ArtworkBrushesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArtworkBrushesTable,
      ArtworkBrushe,
      $$ArtworkBrushesTableFilterComposer,
      $$ArtworkBrushesTableOrderingComposer,
      $$ArtworkBrushesTableAnnotationComposer,
      $$ArtworkBrushesTableCreateCompanionBuilder,
      $$ArtworkBrushesTableUpdateCompanionBuilder,
      (ArtworkBrushe, $$ArtworkBrushesTableReferences),
      ArtworkBrushe,
      PrefetchHooks Function({bool artworkId, bool brushId})
    >;
typedef $$ReferencesTableCreateCompanionBuilder = ReferencesCompanion Function({
  Value<int> id,
  required int artworkId,
  required String label,
  required String urlOrPath,
});
typedef $$ReferencesTableUpdateCompanionBuilder = ReferencesCompanion Function({
  Value<int> id,
  Value<int> artworkId,
  Value<String> label,
  Value<String> urlOrPath,
});

final class $$ReferencesTableReferences
    extends BaseReferences<_$AppDatabase, $ReferencesTable, Reference> {
  $$ReferencesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArtworksTable _artworkIdTable(_$AppDatabase db) =>
      db.artworks.createAlias('references__artwork_id__artworks__id');

  $$ArtworksTableProcessedTableManager get artworkId {
    final $_column = $_itemColumn<int>('artwork_id')!;

    final manager = $$ArtworksTableTableManager(
      $_db,
      $_db.artworks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_artworkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReferencesTableFilterComposer
    extends Composer<_$AppDatabase, $ReferencesTable> {
  $$ReferencesTableFilterComposer({
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

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlOrPath => $composableBuilder(
    column: $table.urlOrPath,
    builder: (column) => ColumnFilters(column),
  );

  $$ArtworksTableFilterComposer get artworkId {
    final $$ArtworksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableFilterComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $ReferencesTable> {
  $$ReferencesTableOrderingComposer({
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

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlOrPath => $composableBuilder(
    column: $table.urlOrPath,
    builder: (column) => ColumnOrderings(column),
  );

  $$ArtworksTableOrderingComposer get artworkId {
    final $$ArtworksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableOrderingComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReferencesTable> {
  $$ReferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get urlOrPath =>
      $composableBuilder(column: $table.urlOrPath, builder: (column) => column);

  $$ArtworksTableAnnotationComposer get artworkId {
    final $$ArtworksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableAnnotationComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReferencesTable,
          Reference,
          $$ReferencesTableFilterComposer,
          $$ReferencesTableOrderingComposer,
          $$ReferencesTableAnnotationComposer,
          $$ReferencesTableCreateCompanionBuilder,
          $$ReferencesTableUpdateCompanionBuilder,
          (Reference, $$ReferencesTableReferences),
          Reference,
          PrefetchHooks Function({bool artworkId})
        > {
  $$ReferencesTableTableManager(_$AppDatabase db, $ReferencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> artworkId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> urlOrPath = const Value.absent(),
              }) => ReferencesCompanion(
                id: id,
                artworkId: artworkId,
                label: label,
                urlOrPath: urlOrPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int artworkId,
                required String label,
                required String urlOrPath,
              }) => ReferencesCompanion.insert(
                id: id,
                artworkId: artworkId,
                label: label,
                urlOrPath: urlOrPath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ReferencesTable, Reference>(table),
                  $$ReferencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({artworkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (artworkId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.artworkId,
                        referencedTable: $$ReferencesTableReferences
                            ._artworkIdTable(db),
                        referencedColumn: $$ReferencesTableReferences
                            ._artworkIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReferencesTable,
      Reference,
      $$ReferencesTableFilterComposer,
      $$ReferencesTableOrderingComposer,
      $$ReferencesTableAnnotationComposer,
      $$ReferencesTableCreateCompanionBuilder,
      $$ReferencesTableUpdateCompanionBuilder,
      (Reference, $$ReferencesTableReferences),
      Reference,
      PrefetchHooks Function({bool artworkId})
    >;
typedef $$FeedbacksTableCreateCompanionBuilder = FeedbacksCompanion Function({
  Value<int> id,
  required int artworkId,
  required String type,
  required String note,
  Value<DateTime> createdAt,
});
typedef $$FeedbacksTableUpdateCompanionBuilder = FeedbacksCompanion Function({
  Value<int> id,
  Value<int> artworkId,
  Value<String> type,
  Value<String> note,
  Value<DateTime> createdAt,
});

final class $$FeedbacksTableReferences
    extends BaseReferences<_$AppDatabase, $FeedbacksTable, Feedback> {
  $$FeedbacksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArtworksTable _artworkIdTable(_$AppDatabase db) =>
      db.artworks.createAlias('feedbacks__artwork_id__artworks__id');

  $$ArtworksTableProcessedTableManager get artworkId {
    final $_column = $_itemColumn<int>('artwork_id')!;

    final manager = $$ArtworksTableTableManager(
      $_db,
      $_db.artworks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_artworkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FeedbacksTableFilterComposer
    extends Composer<_$AppDatabase, $FeedbacksTable> {
  $$FeedbacksTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ArtworksTableFilterComposer get artworkId {
    final $$ArtworksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableFilterComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FeedbacksTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedbacksTable> {
  $$FeedbacksTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ArtworksTableOrderingComposer get artworkId {
    final $$ArtworksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableOrderingComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FeedbacksTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedbacksTable> {
  $$FeedbacksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ArtworksTableAnnotationComposer get artworkId {
    final $$ArtworksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableAnnotationComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FeedbacksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FeedbacksTable,
          Feedback,
          $$FeedbacksTableFilterComposer,
          $$FeedbacksTableOrderingComposer,
          $$FeedbacksTableAnnotationComposer,
          $$FeedbacksTableCreateCompanionBuilder,
          $$FeedbacksTableUpdateCompanionBuilder,
          (Feedback, $$FeedbacksTableReferences),
          Feedback,
          PrefetchHooks Function({bool artworkId})
        > {
  $$FeedbacksTableTableManager(_$AppDatabase db, $FeedbacksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedbacksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedbacksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedbacksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> artworkId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FeedbacksCompanion(
                id: id,
                artworkId: artworkId,
                type: type,
                note: note,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int artworkId,
                required String type,
                required String note,
                Value<DateTime> createdAt = const Value.absent(),
              }) => FeedbacksCompanion.insert(
                id: id,
                artworkId: artworkId,
                type: type,
                note: note,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FeedbacksTable, Feedback>(table),
                  $$FeedbacksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({artworkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (artworkId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.artworkId,
                        referencedTable: $$FeedbacksTableReferences
                            ._artworkIdTable(db),
                        referencedColumn: $$FeedbacksTableReferences
                            ._artworkIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FeedbacksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FeedbacksTable,
      Feedback,
      $$FeedbacksTableFilterComposer,
      $$FeedbacksTableOrderingComposer,
      $$FeedbacksTableAnnotationComposer,
      $$FeedbacksTableCreateCompanionBuilder,
      $$FeedbacksTableUpdateCompanionBuilder,
      (Feedback, $$FeedbacksTableReferences),
      Feedback,
      PrefetchHooks Function({bool artworkId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArtworksTableTableManager get artworks =>
      $$ArtworksTableTableManager(_db, _db.artworks);
  $$BrushesTableTableManager get brushes =>
      $$BrushesTableTableManager(_db, _db.brushes);
  $$ArtworkBrushesTableTableManager get artworkBrushes =>
      $$ArtworkBrushesTableTableManager(_db, _db.artworkBrushes);
  $$ReferencesTableTableManager get references =>
      $$ReferencesTableTableManager(_db, _db.references);
  $$FeedbacksTableTableManager get feedbacks =>
      $$FeedbacksTableTableManager(_db, _db.feedbacks);
}
