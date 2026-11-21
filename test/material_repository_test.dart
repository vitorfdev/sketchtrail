import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/data/material_repository.dart';

void main() {
  test('creates, updates status, and deletes a material', () async {
    final database = AppDatabase(NativeDatabase.memory());
    final repository = MaterialRepository(database);
    addTearDown(database.close);

    final id = await repository.addMaterial(
      MaterialsCompanion.insert(
        title: 'Perspective drawing',
        type: 'Course',
        linkPath: const Value('https://example.com/perspective'),
        status: const Value('Not started'),
      ),
    );

    var materials = await repository.watchAll().first;
    expect(materials.single.title, 'Perspective drawing');
    expect(materials.single.status, 'Not started');

    await repository.updateMaterial(
      MaterialsCompanion(
        id: Value(id),
        status: const Value('Chapter 3 complete'),
      ),
    );

    materials = await repository.watchAll().first;
    expect(materials.single.status, 'Chapter 3 complete');

    await repository.deleteMaterial(id);
    expect(await repository.watchAll().first, isEmpty);
  });
}
