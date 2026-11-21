import 'package:drift/drift.dart';
import 'package:sketchtrail/data/tables/artworks.dart';

class References extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get artworkId =>
      integer().references(Artworks, #id, onDelete: KeyAction.cascade)();
  TextColumn get label => text()();
  TextColumn get urlOrPath => text()();
}