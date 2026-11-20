import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/data/repositories/artwork_repository.dart';

// Provider for the AppDatabase instance
final dbProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

// Provider for the ArtworkRepository instance
final artworkRepoProvider = Provider<ArtworkRepository>((ref) {
  final db = ref.watch(dbProvider);
  return ArtworkRepository(db);
});


// Provider for watching all artworks in the database
final artworksProvider = StreamProvider<List<Artwork>>((ref) {
  final repo = ref.watch(artworkRepoProvider);
  return repo.watchAll();
});