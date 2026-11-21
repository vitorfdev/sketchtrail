import 'package:drift/drift.dart';
import 'package:sketchtrail/data/database.dart';

class MaterialRepository {
  final AppDatabase _db;

  MaterialRepository(this._db);

  Stream<List<Material>> watchAll() {
    return (_db.select(
      _db.materials,
    )..orderBy([(tbl) => OrderingTerm.asc(tbl.title)])).watch();
  }

  Future<int> addMaterial(MaterialsCompanion entry) {
    return _db.into(_db.materials).insert(entry);
  }

  Future<int> updateMaterial(MaterialsCompanion entry) {
    return (_db.update(
      _db.materials,
    )..where((tbl) => tbl.id.equals(entry.id.value))).write(entry);
  }

  Future<int> deleteMaterial(int id) {
    return (_db.delete(_db.materials)..where((tbl) => tbl.id.equals(id))).go();
  }
}
