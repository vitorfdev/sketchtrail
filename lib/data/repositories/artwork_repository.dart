import 'package:sketchtrail/data/database.dart';

class ArtworkRepository {
  final AppDatabase _db;

  ArtworkRepository(this._db);

  // Fetch all artworks from the database (watchAll)
  Stream<List<Artwork>> watchAll() {
    return _db.select(_db.artworks).watch();
  }

  // Create a new artwork in the database
  Future<int> create(ArtworksCompanion artwork) {
    return _db.into(_db.artworks).insert(artwork);
  }

  // Update an existing artwork in the database - Partial update using ArtworksCompanion
  Future<int> update(ArtworksCompanion artwork) {
    return _db.update(_db.artworks).write(artwork);
  }

  // Delete an artwork from the database
  Future<int> delete(int id) {
    return (_db.delete(_db.artworks)..where((tbl) => tbl.id.equals(id))).go();
  }
}