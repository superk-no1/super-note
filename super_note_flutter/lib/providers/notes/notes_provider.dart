import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import '../../models/note_model.dart';
import 'notes_state.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, NotesState>((ref) {
  return NotesNotifier();
});

class NotesNotifier extends StateNotifier<NotesState> {
  NotesNotifier() : super(NotesState()) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    state = state.copyWith(isLoading: true);
    try {
      // TODO: 实现从存储加载笔记
      final notes = _getMockNotes();
      state = state.copyWith(
        notes: notes,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  List<Note> _getMockNotes() {
    return [
      Note(
        id: '1',
        title: '测试笔记1',
        content: '这是一条测试内容',
        createdAt: DateTime(2024, 3, 20),
        updatedAt: DateTime(2024, 3, 20),
      ),
      // ... 其他测试数据
    ];
  }

  void createNote(Note note) {
    state = state.copyWith(
      notes: [...state.notes, note],
    );
  }

  void deleteNote(String id) {
    state = state.copyWith(
      notes: state.notes.where((note) => note.id != id).toList(),
    );
  }

  void updateNote(Note updatedNote) {
    state = state.copyWith(
      notes: state.notes
          .map((note) => note.id == updatedNote.id ? updatedNote : note)
          .toList(),
    );
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }
}

// 分组笔记的派生状态
final groupedNotesProvider = Provider<Map<DateTime, List<Note>>>((ref) {
  final notesState = ref.watch(notesProvider);
  final notes = notesState.notes;
  final query = notesState.searchQuery.toLowerCase();

  final filteredNotes = query.isEmpty
      ? notes
      : notes.where((note) {
          return note.title.toLowerCase().contains(query) ||
              note.content.toLowerCase().contains(query);
        }).toList();

  return groupBy(filteredNotes, (Note note) {
    return DateTime(note.createdAt.year, note.createdAt.month);
  });
});
