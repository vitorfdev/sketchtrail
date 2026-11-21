import 'package:drift/drift.dart';

@DataClassName('Brush')
class Brushes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}