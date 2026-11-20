import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/providers/providers.dart';
import 'package:sketchtrail/services/file_service.dart';
import 'package:sketchtrail/services/thumbnail_service.dart';

class ArtworkFormPage extends ConsumerStatefulWidget {
  const ArtworkFormPage({super.key});

  @override
  ConsumerState<ArtworkFormPage> createState() => _ArtworkFormPageState();
}

class _ArtworkFormPageState extends ConsumerState<ArtworkFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _softwareController = TextEditingController();

  final _fileService = FileService();
  final _thumbnailService = ThumbnailService();

  PickedArtworkFiles? _pickedFiles;
  String? _imageError;
  bool _isSaving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _softwareController.dispose();
    super.dispose();
  }

  Future<void> _selectImage() async {
    if (_isSaving) return;

    final picked = await _fileService.pickAndCopyImage();
    if (picked == null) return;

    setState(() {
      _pickedFiles = picked;
      _imageError = null;
    });
  }

  Future<void> _saveArtwork() async {
    if (_isSaving) return;

    final isFormValid = _formKey.currentState?.validate() ?? false;
    final hasImage = _pickedFiles != null;

    if (!hasImage) {
      setState(() {
        _imageError = 'Select an image before saving.';
      });
    }

    if (!isFormValid || !hasImage) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final picked = _pickedFiles!;
      final baseName = p.basenameWithoutExtension(picked.relativeImagePath);

      // Image already copied to <appSupportDir>/images/
      // Generate thumbnail to <appSupportDir>/thumbnails/
      final thumb = await _thumbnailService.generateThumbnail(
        sourceImagePath: picked.absoluteImagePath,
        baseFileNameWithoutExt: baseName,
      );

      // Insert on db
      final companion = ArtworksCompanion.insert(
        title: _titleController.text.trim(),
        imagePath: picked.relativeImagePath,
        thumbnailPath: thumb.relativeThumbnailPath,
        softwareUsed: _softwareController.text.trim(),
        createdAt: drift.Value(DateTime.now()),
      );

      // Adjust for the correct method 
      await ref.read(artworkRepoProvider).create(companion);

      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving artwork: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Artwork'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Preview + select image button
              Container(
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _imageError != null
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).dividerColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: _pickedFiles != null
                    ? Image.file(
                        File(_pickedFiles!.absoluteImagePath),
                        fit: BoxFit.contain,
                      )
                    : const Center(
                        child: Text('No image selected'),
                      ),
              ),
              if (_imageError != null) ...[
                const SizedBox(height: 6),
                Text(
                  _imageError!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _isSaving ? null : _selectImage,
                icon: const Icon(Icons.image),
                label: Text(
                  _pickedFiles == null ? 'Select Image' : 'Change Image',
                ),
              ),
              const SizedBox(height: 20),

              // Title
              TextFormField(
                controller: _titleController,
                enabled: !_isSaving,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please inform the title of the artwork.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Software Used
              TextFormField(
                controller: _softwareController,
                enabled: !_isSaving,
                decoration: const InputDecoration(
                  labelText: 'Software Used',
                  hintText: 'E.g.: Krita, Clip Studio Paint, Photoshop',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please inform the software used.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Save Button
              FilledButton(
                onPressed: _isSaving ? null : _saveArtwork,
                child: _isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}