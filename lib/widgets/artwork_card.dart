import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/services/file_service.dart';

class ArtworkCard extends StatelessWidget {
  final Artwork artwork;
  final FileService fileService;
  final VoidCallback onTap;

  const ArtworkCard({
    super.key,
    required this.artwork,
    required this.fileService,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FutureBuilder<String>(
                future: fileService.resolveAbsolutePath(artwork.thumbnailPath),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }

                  return Image.file(
                    File(snapshot.data!),
                    fit: BoxFit.cover,
                    cacheWidth: 400,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(Icons.broken_image),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artwork.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    artwork.softwareUsed,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}