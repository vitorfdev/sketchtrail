import 'package:drift/drift.dart';
import 'package:sketchtrail/data/tables/artworks.dart';

class Feedbacks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get artworkId =>
      integer().references(Artworks, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => text()();
  TextColumn get author => text().withDefault(const Constant(''))();
  TextColumn get note => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
