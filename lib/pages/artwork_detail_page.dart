import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart' hide Feedback;
import 'package:sketchtrail/data/database.dart';
import 'package:sketchtrail/pages/artwork_form_page.dart';
import 'package:sketchtrail/providers/providers.dart';
import 'package:sketchtrail/services/file_service.dart';
import 'package:sketchtrail/widgets/post_tile.dart';

class ArtworkDetailPage extends ConsumerWidget {
  final Artwork artwork;

  const ArtworkDetailPage({super.key, required this.artwork});

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

  Future<void> _showAddBrushSheet(
    BuildContext context,
    WidgetRef ref,
    int artworkId,
  ) async {
    final controller = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Brush',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Brush name',
                  hintText: 'e.g. Round Watercolor, Soft Airbrush',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () async {
                  final name = controller.text.trim();
                  if (name.isEmpty) return;

                  await ref
                      .read(artworkRepoProvider)
                      .addBrushToArtwork(artworkId: artworkId, brushName: name);
                  if (sheetContext.mounted) {
                    Navigator.of(sheetContext).pop();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );

    controller.dispose();
  }

  Future<void> _showAddReferenceSheet(
    BuildContext context,
    WidgetRef ref,
    int artworkId,
  ) async {
    final labelController = TextEditingController();
    final urlOrPathController = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Reference',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: labelController,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Label',
                  hintText: 'e.g. Lighting study, Pose reference',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: urlOrPathController,
                decoration: const InputDecoration(
                  labelText: 'URL or local path',
                  hintText: 'https://... or /path/to/reference.jpg',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () async {
                  final label = labelController.text.trim();
                  final urlOrPath = urlOrPathController.text.trim();
                  if (label.isEmpty || urlOrPath.isEmpty) return;

                  await ref
                      .read(artworkRepoProvider)
                      .addReference(
                        ReferencesCompanion.insert(
                          artworkId: artworkId,
                          label: label,
                          urlOrPath: urlOrPath,
                        ),
                      );
                  if (sheetContext.mounted) {
                    Navigator.of(sheetContext).pop();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );

    labelController.dispose();
    urlOrPathController.dispose();
  }

  Future<void> _showAddFeedbackSheet(
    BuildContext context,
    WidgetRef ref,
    int artworkId,
  ) async {
    final noteController = TextEditingController();
    String selectedType = 'critique';

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Add Feedback',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    decoration: const InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'critique',
                        child: Text('Critique'),
                      ),
                      DropdownMenuItem(value: 'note', child: Text('Note')),
                      DropdownMenuItem(value: 'praise', child: Text('Praise')),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setModalState(() => selectedType = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: noteController,
                    autofocus: true,
                    maxLines: 3,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Note',
                      hintText: 'Write your note or critique...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () async {
                      final note = noteController.text.trim();
                      if (note.isEmpty) return;

                      await ref
                          .read(artworkRepoProvider)
                          .addFeedback(
                            FeedbacksCompanion.insert(
                              artworkId: artworkId,
                              type: selectedType,
                              note: note,
                            ),
                          );
                      if (sheetContext.mounted) {
                        Navigator.of(sheetContext).pop();
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    noteController.dispose();
  }

  Future<void> _showPostSheet(
    BuildContext context,
    WidgetRef ref,
    int artworkId, {
    Post? post,
  }) async {
    final platformController = TextEditingController(
      text: post?.platform ?? '',
    );
    final urlController = TextEditingController(text: post?.url ?? '');
    final likesController = TextEditingController(
      text: post?.likes.toString() ?? '0',
    );
    final viewsController = TextEditingController(
      text: post?.views.toString() ?? '0',
    );
    final sharesController = TextEditingController(
      text: post?.shares.toString() ?? '0',
    );
    final upvotesController = TextEditingController(
      text: post?.upvotes.toString() ?? '0',
    );
    final savingsController = TextEditingController(
      text: post?.savings.toString() ?? '0',
    );

    int parseMetric(TextEditingController controller) =>
        int.tryParse(controller.text.trim()) ?? 0;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
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
                  post == null ? 'Add Post' : 'Edit Post',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: platformController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Platform',
                    hintText: 'Instagram, ArtStation, DeviantArt...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: urlController,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'URL',
                    hintText: 'https://...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: likesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Likes',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: viewsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Views',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: sharesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Shares',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: upvotesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Upvotes',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: savingsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Savings',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () async {
                    final platform = platformController.text.trim();
                    final url = urlController.text.trim();
                    if (platform.isEmpty || url.isEmpty) return;

                    final repository = ref.read(artworkRepoProvider);
                    if (post == null) {
                      await repository.addPost(
                        PostsCompanion.insert(
                          artworkId: artworkId,
                          platform: platform,
                          url: url,
                          likes: Value(parseMetric(likesController)),
                          views: Value(parseMetric(viewsController)),
                          shares: Value(parseMetric(sharesController)),
                          upvotes: Value(parseMetric(upvotesController)),
                          savings: Value(parseMetric(savingsController)),
                        ),
                      );
                    } else {
                      await repository.updatePost(
                        PostsCompanion(
                          id: Value(post.id),
                          artworkId: Value(artworkId),
                          platform: Value(platform),
                          url: Value(url),
                          likes: Value(parseMetric(likesController)),
                          views: Value(parseMetric(viewsController)),
                          shares: Value(parseMetric(sharesController)),
                          upvotes: Value(parseMetric(upvotesController)),
                          savings: Value(parseMetric(savingsController)),
                        ),
                      );
                    }
                    if (sheetContext.mounted) {
                      Navigator.of(sheetContext).pop();
                    }
                  },
                  child: Text(post == null ? 'Add Post' : 'Save Changes'),
                ),
              ],
            ),
          ),
        );
      },
    );

    platformController.dispose();
    urlController.dispose();
    likesController.dispose();
    viewsController.dispose();
    sharesController.dispose();
    upvotesController.dispose();
    savingsController.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileService = FileService();
    final repository = ref.read(artworkRepoProvider);

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
            Text(
              'Software Used',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(artwork.softwareUsed),
            const SizedBox(height: 12),
            Text('Created At', style: Theme.of(context).textTheme.labelLarge),
            Text(artwork.createdAt.toString()),
            const SizedBox(height: 20),
            StreamBuilder<List<Brush>>(
              stream: repository.watchArtworkBrushes(artwork.id),
              builder: (context, snapshot) {
                final brushes = snapshot.data ?? const <Brush>[];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Brushes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () =>
                              _showAddBrushSheet(context, ref, artwork.id),
                          icon: const Icon(Icons.add),
                          label: const Text('Add Brush'),
                        ),
                      ],
                    ),
                    if (brushes.isEmpty)
                      const Text('No brushes added yet.')
                    else
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: brushes
                            .map(
                              (brush) => Chip(
                                label: Text(brush.name),
                                onDeleted: () =>
                                    repository.removeBrushFromArtwork(
                                      artworkId: artwork.id,
                                      brushId: brush.id,
                                    ),
                              ),
                            )
                            .toList(),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            StreamBuilder<List<Reference>>(
              stream: repository.watchReferencesForArtwork(artwork.id),
              builder: (context, snapshot) {
                final references = snapshot.data ?? const <Reference>[];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'References',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () =>
                              _showAddReferenceSheet(context, ref, artwork.id),
                          icon: const Icon(Icons.add),
                          label: const Text('Add Reference'),
                        ),
                      ],
                    ),
                    if (references.isEmpty)
                      const Text('No references added yet.')
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: references.length,
                        separatorBuilder: (_, __) => const Divider(height: 8),
                        itemBuilder: (context, index) {
                          final reference = references[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(reference.label),
                            subtitle: Text(
                              reference.urlOrPath,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () =>
                                  repository.removeReference(reference.id),
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            StreamBuilder<List<Feedback>>(
              stream: repository.watchFeedbacksForArtwork(artwork.id),
              builder: (context, snapshot) {
                final feedbacks = snapshot.data ?? const <Feedback>[];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Feedbacks',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () =>
                              _showAddFeedbackSheet(context, ref, artwork.id),
                          icon: const Icon(Icons.add),
                          label: const Text('Add Feedback'),
                        ),
                      ],
                    ),
                    if (feedbacks.isEmpty)
                      const Text('No feedbacks added yet.')
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: feedbacks.length,
                        separatorBuilder: (_, __) => const Divider(height: 8),
                        itemBuilder: (context, index) {
                          final feedback = feedbacks[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(feedback.note),
                            subtitle: Text(feedback.type),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () =>
                                  repository.removeFeedback(feedback.id),
                            ),
                          );
                        },
                      ),
                    const SizedBox(height: 20),
                    StreamBuilder<List<Post>>(
                      stream: repository.watchPostsForArtwork(artwork.id),
                      builder: (context, snapshot) {
                        final posts = snapshot.data ?? const <Post>[];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Posts',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () =>
                                      _showPostSheet(context, ref, artwork.id),
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Post'),
                                ),
                              ],
                            ),
                            if (posts.isEmpty)
                              const Text('No posts added yet.')
                            else
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: posts.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 8),
                                itemBuilder: (context, index) {
                                  final post = posts[index];
                                  return PostTile(
                                    post: post,
                                    onEdit: () => _showPostSheet(
                                      context,
                                      ref,
                                      artwork.id,
                                      post: post,
                                    ),
                                    onDelete: () =>
                                        repository.removePost(post.id),
                                  );
                                },
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
