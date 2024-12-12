import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/note.dart';
import '../services/storage_service.dart';

class NoteListPage extends StatefulWidget {
  final StorageService storageService;

  const NoteListPage({super.key, required this.storageService});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await widget.storageService.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('备忘录'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/edit');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(
              note.content.split('\n').first,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              note.content.split('\n').skip(1).join('\n'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              context.push('/edit/${note.id}');
            },
          );
        },
      ),
    );
  }
}
