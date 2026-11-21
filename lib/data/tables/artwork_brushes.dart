import 'package:drift/drift.dart';
import 'package:sketchtrail/data/tables/artworks.dart';
import 'package:sketchtrail/data/tables/brushes.dart';

class ArtworkBrushes extends Table {
  IntColumn get artworkId =>
      integer().references(Artworks, #id, onDelete: KeyAction.cascade)();
  IntColumn get brushId =>
      integer().references(Brushes, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column<Object>> get primaryKey => {artworkId, brushId};
}