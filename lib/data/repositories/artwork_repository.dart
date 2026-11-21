import 'package:drift/drift.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/services/file_service.dart';

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

  Future<bool> replace(Artwork artwork) {
    return _db.update(_db.artworks).replace(artwork);
  }

  // Delete an artwork from the database
  Future<int> delete(int id) {
    return (_db.delete(_db.artworks)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Delete the files and then erase from db
  Future<void> deleteWithFiles(Artwork artwork, FileService fileService) async {
    await fileService.deleteByRelativePath(artwork.imagePath);
    await fileService.deleteByRelativePath(artwork.thumbnailPath);
    await delete(artwork.id);
  }

  // Brushes (many-to-many via ArtworkBrushes)
  Stream<List<Brush>> watchArtworkBrushes(int artworkId) {
    final query = _db.select(_db.brushes).join([
      innerJoin(
        _db.artworkBrushes,
        _db.artworkBrushes.brushId.equalsExp(_db.brushes.id),
      ),
    ])..where(_db.artworkBrushes.artworkId.equals(artworkId));

    return query.watch().map(
          (rows) => rows.map((row) => row.readTable(_db.brushes)).toList(),
        );
  }

  Future<void> addBrushToArtwork({
    required int artworkId,
    required String brushName,
  }) async {
    final normalized = brushName.trim();
    if (normalized.isEmpty) return;

    await _db.transaction(() async {
      await _db.into(_db.brushes).insert(
            BrushesCompanion.insert(name: normalized),
            mode: InsertMode.insertOrIgnore,
          );

      final brush = await (_db.select(_db.brushes)
            ..where((tbl) => tbl.name.equals(normalized)))
          .getSingle();

      await _db.into(_db.artworkBrushes).insert(
            ArtworkBrushesCompanion.insert(
              artworkId: artworkId,
              brushId: brush.id,
            ),
            mode: InsertMode.insertOrIgnore,
          );
    });
  }

  Future<int> removeBrushFromArtwork({
    required int artworkId,
    required int brushId,
  }) {
    return (_db.delete(_db.artworkBrushes)
          ..where(
            (tbl) =>
                tbl.artworkId.equals(artworkId) & tbl.brushId.equals(brushId),
          ))
        .go();
  }

  // References (one-to-many)
  Stream<List<Reference>> watchReferencesForArtwork(int artworkId) {
    return (_db.select(_db.references)
          ..where((tbl) => tbl.artworkId.equals(artworkId)))
        .watch();
  }

  Future<int> addReference(ReferencesCompanion entry) {
    return _db.into(_db.references).insert(entry);
  }

  Future<int> removeReference(int id) {
    return (_db.delete(_db.references)..where((tbl) => tbl.id.equals(id))).go();
  }

  // Feedbacks (one-to-many with type)
  Stream<List<Feedback>> watchFeedbacksForArtwork(int artworkId) {
    return (_db.select(_db.feedbacks)
          ..where((tbl) => tbl.artworkId.equals(artworkId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .watch();
  }

  Future<int> addFeedback(FeedbacksCompanion entry) {
    return _db.into(_db.feedbacks).insert(entry);
  }

  Future<int> removeFeedback(int id) {
    return (_db.delete(_db.feedbacks)..where((tbl) => tbl.id.equals(id))).go();
  }
}