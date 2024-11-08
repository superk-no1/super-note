import 'package:flutter/material.dart';
import '../../models/note_model.dart';
import '../../utils/date_formatter.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const NoteListItem({
    super.key,
    required this.note,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      dense: true,
      title: Text(
        note.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        note.content,
        style: TextStyle(color: Colors.grey[600]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        DateFormatter.formatDate(note.createdAt),
        style: const TextStyle(color: Colors.grey),
      ),
      onTap: onTap,
    );
  }
}
