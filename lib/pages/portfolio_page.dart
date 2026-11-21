import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/pages/artwork_form_page.dart';
import 'package:sketchtrail/providers/providers.dart';
import 'package:sketchtrail/services/file_service.dart';
import 'package:sketchtrail/widgets/artwork_card.dart';
import 'package:sketchtrail/pages/artwork_detail_page.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artworksAsync = ref.watch(artworksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: artworksAsync.when(
        data: (artworks) {
          if (artworks.isEmpty) {
            return const Center(
              child: Text('No artworks found.'),
            );
          }

          final fileService = FileService();

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: artworks.length,
            itemBuilder: (context, index) {
              final artwork = artworks[index];
              return ArtworkCard(
                artwork: artwork,
                fileService: fileService,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ArtworkDetailPage(artwork: artwork),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const ArtworkFormPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ArtworkThumb extends StatelessWidget {
  final String relativeThumbnailPath;
  final FileService fileService;

  const ArtworkThumb({
    super.key,
    required this.relativeThumbnailPath,
    required this.fileService,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fileService.resolveAbsolutePath(relativeThumbnailPath),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            width: 56,
            height: 56,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }

        return Image.file(
          File(snapshot.data!),
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
        );
      },
    );
  }
}