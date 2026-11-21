import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sketchtrail/data/database.dart' as db;
import 'package:sketchtrail/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialsPage extends ConsumerWidget {
  const MaterialsPage({super.key});

  static const types = <String>[
    'Video',
    'Article',
    'Book',
    'Course',
    'Tutorial',
    'Exercise',
    'Other',
  ];

  Future<void> _openLink(String linkPath) async {
    final uri = Uri.tryParse(linkPath.trim());
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _showMaterialSheet(
    BuildContext context,
    WidgetRef ref, {
    db.Material? material,
  }) async {
    final titleController = TextEditingController(text: material?.title ?? '');
    final linkController = TextEditingController(
      text: material?.linkPath ?? '',
    );
    final statusController = TextEditingController(
      text: material?.status ?? 'Not started',
    );
    var selectedType = material?.type ?? 'Article';
    if (!types.contains(selectedType)) {
      selectedType = 'Other';
    }

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (stateContext, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      material == null ? 'Add Material' : 'Edit Material',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: titleController,
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: selectedType,
                      decoration: const InputDecoration(
                        labelText: 'Type',
                        border: OutlineInputBorder(),
                      ),
                      items: types
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;
                        setModalState(() => selectedType = value);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: linkController,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        labelText: 'Link or path',
                        hintText: 'https://... or /path/to/file',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: statusController,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: 'Status',
                        hintText: 'Not started, In progress, Complete...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () async {
                        final title = titleController.text.trim();
                        if (title.isEmpty) return;

                        final entry = db.MaterialsCompanion(
                          id: material == null
                              ? const Value.absent()
                              : Value(material.id),
                          title: Value(title),
                          type: Value(selectedType),
                          linkPath: Value(linkController.text.trim()),
                          status: Value(
                            statusController.text.trim().isEmpty
                                ? 'Not started'
                                : statusController.text.trim(),
                          ),
                        );
                        final repository = ref.read(materialRepoProvider);
                        if (material == null) {
                          await repository.addMaterial(
                            db.MaterialsCompanion.insert(
                              title: title,
                              type: selectedType,
                              linkPath: Value(linkController.text.trim()),
                              status: Value(
                                statusController.text.trim().isEmpty
                                    ? 'Not started'
                                    : statusController.text.trim(),
                              ),
                            ),
                          );
                        } else {
                          await repository.updateMaterial(entry);
                        }

                        if (sheetContext.mounted) {
                          Navigator.of(sheetContext).pop();
                        }
                      },
                      child: Text(material == null ? 'Add Material' : 'Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    titleController.dispose();
    linkController.dispose();
    statusController.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(materialRepoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Materials')),
      body: StreamBuilder<List<db.Material>>(
        stream: repository.watchAll(),
        builder: (context, snapshot) {
          final materials = snapshot.data ?? const <db.Material>[];

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (materials.isEmpty) {
            return const Center(child: Text('No materials added yet.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: materials.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final material = materials[index];
              return Card(
                margin: EdgeInsets.zero,
                child: ListTile(
                  title: Text(material.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${material.type} - ${material.status}'),
                      if (material.linkPath.isNotEmpty)
                        Text(
                          material.linkPath,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  onTap: material.linkPath.isEmpty
                      ? null
                      : () => _openLink(material.linkPath),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: 'Edit material',
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () => _showMaterialSheet(
                          context,
                          ref,
                          material: material,
                        ),
                      ),
                      IconButton(
                        tooltip: 'Delete material',
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => repository.deleteMaterial(material.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMaterialSheet(context, ref),
        tooltip: 'Add material',
        child: const Icon(Icons.add),
      ),
    );
  }
}
