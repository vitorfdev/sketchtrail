import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/data/repositories/artwork_repository.dart';
import 'package:sketchtrail/providers/providers.dart';

void main() {
  late AppDatabase database;
  late ProviderContainer container;
  late ArtworkRepository repository;

  final emittedValues = <List<Artwork>>[];
  final waiters =
      <
        ({
          bool Function(List<Artwork>) matches,
          Completer<List<Artwork>> completer,
        })
      >[];

  setUp(() {
    emittedValues.clear();
    waiters.clear();
    database = AppDatabase(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [dbProvider.overrideWithValue(database)],
    );
    repository = container.read(artworkRepoProvider);
    container.listen(artworksProvider, (_, state) {
      state.whenData((artworks) {
        emittedValues.add(artworks);
        for (final waiter in waiters.toList()) {
          if (waiter.matches(artworks)) {
            waiters.remove(waiter);
            waiter.completer.complete(artworks);
          }
        }
      });
    });
  });

  tearDown(() async {
    container.dispose();
    await database.close();
  });

  Future<List<Artwork>> waitForArtworks(bool Function(List<Artwork>) matches) {
    for (final artworks in emittedValues.reversed) {
      if (matches(artworks)) {
        return Future.value(artworks);
      }
    }

    final completer = Completer<List<Artwork>>();
    waiters.add((matches: matches, completer: completer));
    return completer.future.timeout(const Duration(seconds: 5));
  }

  test('creates, watches, partially updates, and deletes an artwork', () async {
    expect(await waitForArtworks((artworks) => artworks.isEmpty), isEmpty);

    final id = await repository.create(
      ArtworksCompanion.insert(
        title: 'First artwork',
        imagePath: '/artworks/first.png',
        thumbnailPath: '/artworks/first-thumb.png',
        softwareUsed: 'Krita',
        canvasWidth: const Value(1920),
        canvasHeight: const Value(1080),
        timeSpentMinutes: const Value(45),
        concept: const Value('Landscape'),
      ),
    );

    final created = await waitForArtworks(
      (artworks) => artworks.length == 1 && artworks.single.id == id,
    );
    expect(created.single.title, 'First artwork');
    expect(created.single.imagePath, '/artworks/first.png');
    expect(created.single.thumbnailPath, '/artworks/first-thumb.png');
    expect(created.single.softwareUsed, 'Krita');

    expect(
      await repository.update(
        ArtworksCompanion(id: Value(id), title: const Value('Updated artwork')),
      ),
      1,
    );

    final updated = await waitForArtworks(
      (artworks) =>
          artworks.length == 1 && artworks.single.title == 'Updated artwork',
    );
    expect(updated.single.id, id);
    expect(updated.single.imagePath, '/artworks/first.png');
    expect(updated.single.thumbnailPath, '/artworks/first-thumb.png');
    expect(updated.single.softwareUsed, 'Krita');
    expect(updated.single.canvasWidth, 1920);
    expect(updated.single.canvasHeight, 1080);
    expect(updated.single.timeSpentMinutes, 45);
    expect(updated.single.concept, 'Landscape');

    expect(await repository.delete(id), 1);
    expect(await waitForArtworks((artworks) => artworks.isEmpty), isEmpty);
  });
}
