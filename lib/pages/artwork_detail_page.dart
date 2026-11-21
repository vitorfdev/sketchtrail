import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/pages/artwork_form_page.dart';
import 'package:sketchtrail/providers/providers.dart';
import 'package:sketchtrail/services/file_service.dart';

class ArtworkDetailPage extends ConsumerWidget {
  final Artwork artwork;

  const ArtworkDetailPage({
    super.key,
    required this.artwork,
  });

  Future<void> _confirmAndDelete(BuildContext context, WidgetRef ref) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete artwork?'),
          content: Text(
            'This will remove "${artwork.title}" and delete the files from disk.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true || !context.mounted) return;

    final fileService = FileService();
    await fileService.deleteByRelativePath(artwork.imagePath);
    await fileService.deleteByRelativePath(artwork.thumbnailPath);
    await ref.read(artworkRepoProvider).delete(artwork.id);

    if (!context.mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileService = FileService();

    return Scaffold(
      appBar: AppBar(
        title: Text(artwork.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ArtworkFormPage(artwork: artwork),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmAndDelete(context, ref),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<String>(
              future: fileService.resolveAbsolutePath(artwork.imagePath),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox(
                    height: 260,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return Image.file(
                  File(snapshot.data!),
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image, size: 48)),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text('Title', style: Theme.of(context).textTheme.labelLarge),
            Text(artwork.title),
            const SizedBox(height: 12),
            Text('Software Used', style: Theme.of(context).textTheme.labelLarge),
            Text(artwork.softwareUsed),
            const SizedBox(height: 12),
            Text('Created At', style: Theme.of(context).textTheme.labelLarge),
            Text(artwork.createdAt.toString()),
          ],
        ),
      ),
    );
  }
}