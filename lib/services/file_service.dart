import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class PickedArtworkFiles {
  final String relativeImagePath;
  final String absoluteImagePath;

  const PickedArtworkFiles({
    required this.relativeImagePath,
    required this.absoluteImagePath,
  });
}

class FileService {
  static const String _imagesFolderName = 'images';

  // Return the app directory path
  Future<Directory> getImagesDirectory() async {
    final supportDir = await getApplicationSupportDirectory();
    final imagesDir = Directory(p.join(supportDir.path, _imagesFolderName));
    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }
    return imagesDir;
  }

  // Convert the relative path saved in db to an absolute path
  Future<String> resolveAbsolutePath(String relativePath) async {
    final supportDir = await getApplicationSupportDirectory();
    return p.join(supportDir.path, relativePath);
  }

  // Open the image selector and copy the file chosen
  Future<PickedArtworkFiles?> pickAndCopyImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['png', 'jpg', 'jpeg', 'webp'],
    );

    if (result.isEmpty) {
      return null; // User canceled the picker
    }

    final pickedPath = result.single.path;
    if (pickedPath == null) {
      return null; // No valid path was returned
    }

    final sourceFile = File(pickedPath);
    if (!await sourceFile.exists()) {
      return null; // Source file doesn't exist
    }

    final extension = p.extension(pickedPath).toLowerCase();
    final safeExtension = extension.isEmpty ? '.png' : extension; // Default to .png if no extension
    final uniqueFileName = '${DateTime.now().microsecondsSinceEpoch}$safeExtension';

    final imagesDir = await getImagesDirectory();
    final destinationFile = File(p.join(imagesDir.path, uniqueFileName)); 

    await sourceFile.copy(destinationFile.path);

    final relativePath = p.posix.join(_imagesFolderName, uniqueFileName);

    return PickedArtworkFiles(
      relativeImagePath: relativePath,
      absoluteImagePath: destinationFile.path,
    );
  }
}