import 'package:drift/drift.dart';

class Materials extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get type => text()();
  TextColumn get linkPath => text().withDefault(const Constant(''))();
  TextColumn get status => text().withDefault(const Constant('Not started'))();
}
