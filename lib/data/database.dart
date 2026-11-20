import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sketchtrail/data/tables/artworks.dart';

part 'database.g.dart';

// Main database class that handles the connection to the database and provides access to the tables.
@DriftDatabase(tables: [Artworks])
class AppDatabase extends _$AppDatabase {
  // New instance of the database
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  // Increment the schema version when you change the tables and columns.
  @override
  int get schemaVersion => 1;
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
