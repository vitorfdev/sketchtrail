import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketchtrail/data/database.dart';

void main() {
  test('feedback author is stored and restored', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    final artworkId = await database
        .into(database.artworks)
        .insert(
          ArtworksCompanion.insert(
            title: 'Portrait',
            imagePath: '/artwork.png',
            thumbnailPath: '/thumbnail.png',
            softwareUsed: 'Krita',
          ),
        );

    await database
        .into(database.feedbacks)
        .insert(
          FeedbacksCompanion.insert(
            artworkId: artworkId,
            type: 'critique',
            author: const Value('Jamie'),
            note: 'Improve the edge contrast',
          ),
        );

    final feedback = await database.select(database.feedbacks).getSingle();
    expect(feedback.author, 'Jamie');
    expect(feedback.note, 'Improve the edge contrast');
  });
}
