import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:sketchtrail/data/tables/artworks.dart';
import 'package:sketchtrail/data/tables/artwork_brushes.dart';
import 'package:sketchtrail/data/tables/brushes.dart';
import 'package:sketchtrail/data/tables/feedbacks.dart';
import 'package:sketchtrail/data/tables/materials.dart';
import 'package:sketchtrail/data/tables/posts.dart';
import 'package:sketchtrail/data/tables/references.dart';
import 'package:sketchtrail/data/tables/tasks.dart';

part 'database.g.dart';

// Main database class that handles the connection to the database and provides access to the tables.
@DriftDatabase(
  tables: [
    Artworks,
    Brushes,
    ArtworkBrushes,
    References,
    Feedbacks,
    Posts,
    Tasks,
    Materials,
  ],
)
class AppDatabase extends _$AppDatabase {
  // New instance of the database
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  // Increment the schema version when you change the tables and columns.
  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(brushes);
        await m.createTable(artworkBrushes);
        await m.createTable(references);
        await m.createTable(feedbacks);
      }
      if (from < 3) {
        await m.createTable(posts);
      }
      if (from < 4) {
        await m.createTable(tasks);
      }
      if (from < 5) {
        await m.createTable(materials);
      }
      // Version 1 databases create the Feedbacks table from the current schema,
      // so they already receive the author column while creating it.
      if (from >= 2 && from < 6) {
        await m.addColumn(feedbacks, feedbacks.author);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON;');
    },
  );
}

// Creating lazy database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Get the application documents directory
    final dbFolder = await getApplicationDocumentsDirectory();
    // Create a file path for the database file
    final file = File(p.join(dbFolder.path, 'sketchtrail.sqlite'));
    // Return a NativeDatabase instance that uses the file path
    return NativeDatabase.createInBackground(file);
  });
}
