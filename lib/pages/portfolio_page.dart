import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/providers/providers.dart';

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
          return ListView.builder(
            itemCount: artworks.length,
            itemBuilder: (context, index) {
              final artwork = artworks[index];
              return ListTile(
                title: Text(artwork.title),
                subtitle: Text('${artwork.softwareUsed} • ID: ${artwork.id}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    ref.read(artworkRepoProvider).delete(artwork.id);
                  }
                )
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(artworkRepoProvider).create(
            ArtworksCompanion(
              title: Value('Arte Fake ${DateTime.now().second}'),
              imagePath: Value('/fake/path/img_${DateTime.now().millisecondsSinceEpoch}.png'),
              thumbnailPath: Value('/fake/path/thumb.png'),
              softwareUsed: Value('Krita'),
            )
          );
        }
      ),
    );
  }
}