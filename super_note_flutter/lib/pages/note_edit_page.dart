import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/storage_service.dart';
import '../utils/constants.dart';
import '../widgets/back_button_with_text.dart';

class NoteEditPage extends StatefulWidget {
  final Note? note;
  final StorageService storageService;
  final Function(Note) onSave;

  const NoteEditPage({
    super.key,
    this.note,
    required this.storageService,
    required this.onSave,
  });

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController =
        TextEditingController(text: widget.note?.content ?? '');
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final note = widget.note?.copyWith(
          content: _contentController.text,
          updatedAt: DateTime.now(),
        ) ??
        Note(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: _contentController.text,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

    widget.onSave(note);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildNoteEditor(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: BackButtonWithText(
        text: '备忘录',
        onPressed: () => Navigator.of(context).pop(),
      ),
      leadingWidth: 100,
      actions: [
        TextButton(
          onPressed: _handleSave,
          child: const Text(
            '完成',
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteEditor() {
    return TextField(
      controller: _contentController,
      maxLines: null,
      expands: true,
      autofocus: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(16),
        hintText: '输入文字',
      ),
      style: const TextStyle(
        fontSize: 17,
        height: 1.5,
      ),
    );
  }
}
