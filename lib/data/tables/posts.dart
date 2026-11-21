import 'package:drift/drift.dart';
import 'package:sketchtrail/data/tables/artworks.dart';

class Posts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get artworkId =>
      integer().references(Artworks, #id, onDelete: KeyAction.cascade)();
  TextColumn get platform => text()();
  TextColumn get url => text()();
  IntColumn get likes => integer().withDefault(const Constant(0))();
  IntColumn get views => integer().withDefault(const Constant(0))();
  IntColumn get shares => integer().withDefault(const Constant(0))();
  IntColumn get upvotes => integer().withDefault(const Constant(0))();
  IntColumn get savings => integer().withDefault(const Constant(0))();
}
