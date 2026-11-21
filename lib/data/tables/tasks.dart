import 'package:drift/drift.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get taskDate => dateTime()();
  BoolColumn get done => boolean().withDefault(const Constant(false))();
}
