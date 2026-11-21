import 'package:material_ui/material_ui.dart';
import 'package:sketchtrail/data/database.dart';
import 'package:url_launcher/url_launcher.dart';

class PostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PostTile({
    super.key,
    required this.post,
    required this.onEdit,
    required this.onDelete,
  });

  Future<void> _openLink() async {
    final uri = Uri.tryParse(post.url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _openLink,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.platform,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          post.url,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Open post',
                  icon: const Icon(Icons.open_in_new),
                  onPressed: _openLink,
                ),
                IconButton(
                  tooltip: 'Edit post',
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: onEdit,
                ),
                IconButton(
                  tooltip: 'Delete post',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                Chip(
                  label: Text('Likes ${post.likes}'),
                  visualDensity: VisualDensity.compact,
                ),
                Chip(
                  label: Text('Views ${post.views}'),
                  visualDensity: VisualDensity.compact,
                ),
                Chip(
                  label: Text('Shares ${post.shares}'),
                  visualDensity: VisualDensity.compact,
                ),
                Chip(
                  label: Text('Upvotes ${post.upvotes}'),
                  visualDensity: VisualDensity.compact,
                ),
                Chip(
                  label: Text('Savings ${post.savings}'),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
