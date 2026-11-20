import 'package:drift/drift.dart';

class Artworks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get imagePath => text()();
  TextColumn get thumbnailPath => text()();
  TextColumn get softwareUsed => text()();
  IntColumn get canvasWidth => integer().nullable()();
  IntColumn get canvasHeight => integer().nullable()();
  IntColumn get timeSpentMinutes => integer().nullable()();
  TextColumn get concept => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}