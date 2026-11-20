import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class GeneratedThumbnailPaths {
  final String relativeThumbnailPath;
  final String absoluteThumbnailPath;

  const GeneratedThumbnailPaths({
    required this.relativeThumbnailPath,
    required this.absoluteThumbnailPath,
  });
}

class _ThumbnailWorkInput {
  final Uint8List sourceBytes;
  final int targetWidth;
  final int jpgQuality;

  const _ThumbnailWorkInput({
    required this.sourceBytes,
    required this.targetWidth,
    required this.jpgQuality,
  });
}

Uint8List _resizeAndEncodeJpg(_ThumbnailWorkInput input) {
  final decoded = img.decodeImage(input.sourceBytes);
  if (decoded == null) {
    throw Exception('Failed to decode image for thumbnail generation.');
  }

  // Resize the image while maintaining aspect ratio
  final resized = img.copyResize(
    decoded,
    width: input.targetWidth,
    interpolation: img.Interpolation.average,
  );

  final jpgBytes = img.encodeJpg(resized, quality: input.jpgQuality);
  return Uint8List.fromList(jpgBytes);
}

class ThumbnailService {
  static const String _thumbnailsFolderName = 'thumbnails';

  Future<Directory> getThumbnailsDirectory() async {
    final supportDir = await getApplicationSupportDirectory();
    final thumbsDir = Directory(p.join(supportDir.path, _thumbnailsFolderName));
    if (!await thumbsDir.exists()) {
      await thumbsDir.create(recursive: true);
    }
    return thumbsDir;
  }

  // Generate a thumbnail for the given image bytes and save it to the thumbnails directory
  Future<GeneratedThumbnailPaths> generateThumbnail({
    required String sourceImagePath,
    required String baseFileNameWithoutExt,
    int width = 512,
    int quality = 85,
  }) async {
    final sourceFile = File(sourceImagePath);
    final bytes = await sourceFile.readAsBytes();

    final encodedBytes = await compute(
      _resizeAndEncodeJpg,
      _ThumbnailWorkInput(
        sourceBytes: bytes,
        targetWidth: width,
        jpgQuality: quality,
      ),
    );

    final thumbsDir = await getThumbnailsDirectory();
    final thumbFileName = '${baseFileNameWithoutExt}_thumb.jpg';
    final thumbFile = File(p.join(thumbsDir.path, thumbFileName));

    await thumbFile.writeAsBytes(encodedBytes, flush: true);

    final relativePath = p.posix.join(_thumbnailsFolderName, thumbFileName);

    return GeneratedThumbnailPaths(
      relativeThumbnailPath: relativePath,
      absoluteThumbnailPath: thumbFile.path,
    );
  }
}